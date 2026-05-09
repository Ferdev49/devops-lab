# Kubernetes Deployment Guide - Day 27

## Overview

Kubernetes manifests for deploying 3 microservices.

## Files Created

### Core Files
- namespace.yaml - Namespace for all resources
- configmaps.yaml - Configuration for all services
- kustomization.yaml - Kustomize overlay

### Deployments
- user-service-deployment.yaml - User service deployment (3 replicas)
- order-service-deployment.yaml - Order service deployment (3 replicas)
- payment-service-deployment.yaml - Payment service deployment (3 replicas)

### Services
- user-service-service.yaml - ClusterIP service for user service
- order-service-service.yaml - ClusterIP service for order service
- payment-service-service.yaml - ClusterIP service for payment service

## Deployment Specifications

### Each Deployment Includes
- 3 replicas for high availability
- Rolling update strategy (maxSurge: 1, maxUnavailable: 0)
- Health checks (liveness & readiness probes)
- Resource requests & limits
- Security context (non-root user)
- Environment variables from ConfigMaps

### Health Checks
- Liveness: Restarts unhealthy pods
  - Initial delay: 10s
  - Period: 30s
  - Failure threshold: 3
- Readiness: Removes unhealthy pods from service
  - Initial delay: 5s
  - Period: 10s
  - Failure threshold: 2

### Resource Limits
Per pod:
- Requests: 100m CPU, 128Mi memory
- Limits: 500m CPU, 256Mi memory

## Service Discovery

Services use ClusterIP type for internal communication.

Service URLs:
- User Service: http://user-service.microservices.svc.cluster.local:8000
- Order Service: http://order-service.microservices.svc.cluster.local:8000
- Payment Service: http://payment-service.microservices.svc.cluster.local:8000

Short names (same namespace):
- http://user-service:8000
- http://order-service:8000
- http://payment-service:8000

## Deployment Commands

### Using kubectl directly
```bash
# Create namespace
kubectl create -f namespace.yaml

# Create ConfigMaps
kubectl create -f configmaps.yaml

# Create deployments and services
kubectl create -f user-service-deployment.yaml
kubectl create -f user-service-service.yaml
kubectl create -f order-service-deployment.yaml
kubectl create -f order-service-service.yaml
kubectl create -f payment-service-deployment.yaml
kubectl create -f payment-service-service.yaml
```

### Using Kustomize (Recommended)
```bash
# Deploy all resources
kubectl apply -k ./

# Verify deployment
kubectl get namespaces
kubectl get deployments -n microservices
kubectl get services -n microservices
kubectl get pods -n microservices
```

## Verification Commands

```bash
# Check namespaces
kubectl get namespaces

# Check deployments
kubectl get deployments -n microservices
kubectl describe deployment user-service -n microservices

# Check services
kubectl get services -n microservices
kubectl get svc -n microservices

# Check pods
kubectl get pods -n microservices
kubectl describe pod <pod-name> -n microservices

# Check logs
kubectl logs -f deployment/user-service -n microservices

# Port forward to test
kubectl port-forward svc/user-service 8000:8000 -n microservices
curl http://localhost:8000/health
```

## Rolling Updates

Update image version:
```bash
kubectl set image deployment/user-service user-service=ferdev49/user-service:v2 -n microservices
```

Check rollout status:
```bash
kubectl rollout status deployment/user-service -n microservices
```

Rollback if needed:
```bash
kubectl rollout undo deployment/user-service -n microservices
```

## Scaling

Scale deployment:
```bash
kubectl scale deployment/user-service --replicas=5 -n microservices
```

Check current replicas:
```bash
kubectl get deployment user-service -n microservices -o wide
```

## Cleanup

Delete all resources:
```bash
kubectl delete -k ./
```

Or delete specific resource:
```bash
kubectl delete deployment user-service -n microservices
```

## Next Steps (Day 28)

1. Build and push Docker images
2. Deploy to Kubernetes cluster
3. Test inter-service communication
4. Implement API Gateway (optional)
