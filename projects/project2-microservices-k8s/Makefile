.PHONY: help build push deploy test logs clean

DOCKER_USERNAME=ferdev49
SERVICES=user-service order-service payment-service
K8S_NAMESPACE=microservices

help:
@echo "Available commands:"
@echo "  make build       - Build all Docker images"
@echo "  make push        - Push images to Docker registry"
@echo "  make deploy      - Deploy to Kubernetes"
@echo "  make test        - Run local docker-compose tests"
@echo "  make logs        - View Kubernetes logs"
@echo "  make clean       - Delete Kubernetes resources"
@echo "  make port-fwd    - Port forward to services"

build:
@echo "Building Docker images..."
@for service in $(SERVICES); do \
echo "Building $$service..."; \
docker build -t $(DOCKER_USERNAME)/$$service:latest services/$$service/; \
done
@echo "✅ All images built"

push: build
@echo "Pushing to Docker registry..."
@for service in $(SERVICES); do \
echo "Pushing $$service..."; \
docker push $(DOCKER_USERNAME)/$$service:latest; \
done
@echo "✅ All images pushed"

deploy:
@echo "Creating namespace..."
kubectl create namespace $(K8S_NAMESPACE) --dry-run=client -o yaml | kubectl apply -f -
@echo "Deploying to Kubernetes..."
kubectl apply -k kubernetes/
@echo "✅ Deployment complete"

verify:
@echo "Waiting for pods to be ready..."
kubectl wait --for=condition=Ready pod -l app=user-service -n $(K8S_NAMESPACE) --timeout=300s
kubectl wait --for=condition=Ready pod -l app=order-service -n $(K8S_NAMESPACE) --timeout=300s
kubectl wait --for=condition=Ready pod -l app=payment-service -n $(K8S_NAMESPACE) --timeout=300s
@echo "✅ All pods ready"
@echo ""
@echo "Deployments:"
kubectl get deployments -n $(K8S_NAMESPACE)
@echo ""
@echo "Services:"
kubectl get services -n $(K8S_NAMESPACE)
@echo ""
@echo "Pods:"
kubectl get pods -n $(K8S_NAMESPACE)

test:
@echo "Running docker-compose tests..."
docker-compose up -d
@sleep 5
@echo "Testing user-service..."
curl -s http://localhost:5000/health | python -m json.tool
@echo ""
@echo "Testing order-service..."
curl -s http://localhost:5001/health | python -m json.tool
@echo ""
@echo "Testing payment-service..."
curl -s http://localhost:5002/health | python -m json.tool
docker-compose down

logs:
@echo "Tailing logs from user-service..."
kubectl logs -f deployment/user-service -n $(K8S_NAMESPACE)

port-fwd:
@echo "Port forwarding to services..."
@echo "User Service (5000):"
kubectl port-forward svc/user-service 8000:8000 -n $(K8S_NAMESPACE) &
@echo "Order Service (5001):"
kubectl port-forward svc/order-service 8001:8000 -n $(K8S_NAMESPACE) &
@echo "Payment Service (5002):"
kubectl port-forward svc/payment-service 8002:8000 -n $(K8S_NAMESPACE) &
@echo "Port forwarding started. Press Ctrl+C to stop."

clean:
@echo "Deleting Kubernetes resources..."
kubectl delete namespace $(K8S_NAMESPACE)
@echo "✅ Resources deleted"
