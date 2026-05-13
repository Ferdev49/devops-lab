# Day 28: Docker Build & Kubernetes Deployment

## Prerequisites

Before deploying, ensure you have:
- Docker installed and running
- Docker Hub account (or other container registry)
- Kubernetes cluster (minikube, Docker Desktop K8s, or cloud cluster)
- kubectl configured to access cluster
- make (optional, for using Makefile)

## Step 1: Build Docker Images

Build all three Docker images locally:

```bash
# Build user-service
docker build -t ferdev49/user-service:latest services/user-service/

# Build order-service
docker build -t ferdev49/order-service:latest services/order-service/

# Build payment-service
docker build -t ferdev49/payment-service:latest services/payment-service/

# Or using Makefile:
make build
```

## Step 2: Test Locally with docker-compose

Before pushing to registry, test locally:

```bash
# Start all services
docker-compose up -d

# Test health checks
curl http://localhost:5000/health
curl http://localhost:5001/health
curl http://localhost:5002/health

# Test user service API
curl http://localhost:5000/users

# Stop services
docker-compose down

# Or using Makefile:
make test
```

## Step 3: Push to Docker Registry

Push images to Docker Hub (or your registry):

```bash
# Login to Docker Hub (if not already logged in)
docker login

# Push images
docker push ferdev49/user-service:latest
docker push ferdev49/order-service:latest
docker push ferdev49/payment-service:latest

# Or using Makefile:
make push
```

## Step 4: Create Kubernetes Namespace

Create the microservices namespace:

```bash
kubectl create namespace microservices
```

Or it will be created automatically with deployment.

## Step 5: Deploy to Kubernetes

Deploy all resources:

```bash
# Deploy using Kustomize
kubectl apply -k kubernetes/

# Or using Makefile:
make deploy
```

## Step 6: Verify Deployment

Check that all pods are running:

```bash
# Check deployments
kubectl get deployments -n microservices

# Check services
kubectl get services -n microservices

# Check pods
kubectl get pods -n microservices

# Wait for pods to be ready
kubectl wait --for=condition=Ready pod -l app=user-service -n microservices --timeout=300s

# Or using Makefile:
make verify
```

## Step 7: Test Kubernetes Deployment

### Method 1: Port Forwarding

```bash
# Port forward to user-service
kubectl port-forward svc/user-service 8000:8000 -n microservices

# In another terminal, test
curl http://localhost:8000/health
curl http://localhost:8000/users
```

### Method 2: Port Forward All Services

```bash
# Terminal 1: User Service
kubectl port-forward svc/user-service 8000:8000 -n microservices

# Terminal 2: Order Service
kubectl port-forward svc/order-service 8001:8000 -n microservices

# Terminal 3: Payment Service
kubectl port-forward svc/payment-service 8002:8000 -n microservices

# Terminal 4: Test
curl http://localhost:8000/health
curl http://localhost:8001/health
curl http://localhost:8002/health
```

## Step 8: View Logs

Check logs from running pods:

```bash
# View logs from user-service deployment
kubectl logs -f deployment/user-service -n microservices

# View logs from specific pod
kubectl logs -f <pod-name> -n microservices

# View logs from all pods in deployment
kubectl logs -f deployment/user-service -n microservices --all-containers=true
```

## Step 9: Test Inter-Service Communication

Services can communicate with each other using service DNS:

```bash
# Get a shell in a pod
kubectl exec -it <pod-name> -n microservices -- /bin/sh

# Inside the pod, test service discovery
curl http://user-service:8000/users
curl http://order-service:8000/orders
curl http://payment-service:8000/payments
```

## Troubleshooting

### Pods not starting

```bash
# Describe pod to see events
kubectl describe pod <pod-name> -n microservices

# Check image pull status
kubectl get events -n microservices

# Check if image exists in registry
docker pull ferdev49/user-service:latest
```

### Service not accessible

```bash
# Check service exists
kubectl get svc -n microservices

# Check endpoints
kubectl get endpoints -n microservices

# Check service DNS
kubectl run -it --rm debug --image=busybox --restart=Never -- nslookup user-service.microservices
```

### Pod logs show errors

```bash
# View full logs
kubectl logs <pod-name> -n microservices

# View previous logs (if pod crashed)
kubectl logs <pod-name> -n microservices --previous

# View logs with timestamps
kubectl logs <pod-name> -n microservices --timestamps=true
```

## Clean Up

Delete all resources:

```bash
# Delete everything in namespace
kubectl delete namespace microservices

# Or delete specific resources
kubectl delete -k kubernetes/

# Or using Makefile:
make clean
```

## Next Steps (Day 29)

1. Test inter-service communication
2. Implement service mesh (optional)
3. Add horizontal pod autoscaling
4. Configure resource monitoring
