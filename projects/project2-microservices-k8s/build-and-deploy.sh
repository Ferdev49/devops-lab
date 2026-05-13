#!/bin/bash
set -e

# Configuration
DOCKER_USERNAME="ferdev49"
REGISTRY="docker.io"
SERVICES=("user-service" "order-service" "payment-service")
K8S_NAMESPACE="microservices"

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║          Docker Build & Kubernetes Deployment Script           ║"
echo "╚════════════════════════════════════════════════════════════════╝"

# Step 1: Build Docker images
echo ""
echo "Step 1: Building Docker images..."
for service in "${SERVICES[@]}"; do
    echo "Building $service..."
    docker build -t $DOCKER_USERNAME/$service:latest services/$service/
    if [ $? -eq 0 ]; then
        echo "✅ $service built successfully"
    else
        echo "❌ Failed to build $service"
        exit 1
    fi
done

# Step 2: Push to Docker Registry
echo ""
echo "Step 2: Pushing to Docker Registry..."
for service in "${SERVICES[@]}"; do
    echo "Pushing $service..."
    docker push $DOCKER_USERNAME/$service:latest
    if [ $? -eq 0 ]; then
        echo "✅ $service pushed successfully"
    else
        echo "❌ Failed to push $service"
        exit 1
    fi
done

# Step 3: Create Kubernetes namespace
echo ""
echo "Step 3: Creating Kubernetes namespace..."
kubectl create namespace $K8S_NAMESPACE --dry-run=client -o yaml | kubectl apply -f -
echo "✅ Namespace $K8S_NAMESPACE created/verified"

# Step 4: Deploy to Kubernetes
echo ""
echo "Step 4: Deploying to Kubernetes..."
kubectl apply -k kubernetes/
if [ $? -eq 0 ]; then
    echo "✅ Kubernetes deployment successful"
else
    echo "❌ Failed to deploy to Kubernetes"
    exit 1
fi

# Step 5: Verify deployment
echo ""
echo "Step 5: Verifying deployment..."
echo ""
echo "Waiting for pods to be ready..."
kubectl wait --for=condition=Ready pod -l app=user-service -n $K8S_NAMESPACE --timeout=300s
kubectl wait --for=condition=Ready pod -l app=order-service -n $K8S_NAMESPACE --timeout=300s
kubectl wait --for=condition=Ready pod -l app=payment-service -n $K8S_NAMESPACE --timeout=300s

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   ✅ DEPLOYMENT COMPLETE!                      ║"
echo "╚════════════════════════════════════════════════════════════════╝"

echo ""
echo "Deployments:"
kubectl get deployments -n $K8S_NAMESPACE

echo ""
echo "Services:"
kubectl get services -n $K8S_NAMESPACE

echo ""
echo "Pods:"
kubectl get pods -n $K8S_NAMESPACE

echo ""
echo "Next steps:"
echo "1. Port forward to test services:"
echo "   kubectl port-forward svc/user-service 8000:8000 -n $K8S_NAMESPACE"
echo "   curl http://localhost:8000/users"
echo ""
echo "2. View logs:"
echo "   kubectl logs -f deployment/user-service -n $K8S_NAMESPACE"
echo ""
echo "3. Describe pods:"
echo "   kubectl describe pod <pod-name> -n $K8S_NAMESPACE"
