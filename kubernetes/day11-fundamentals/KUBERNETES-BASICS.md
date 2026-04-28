# Kubernetes Fundamentals - Day 11

## What is Kubernetes?

Kubernetes (k8s) is an open-source container orchestration platform that:
- Manages containerized applications
- Scales containers automatically
- Self-heals failing containers
- Manages networking and storage
- Rolls out updates with zero downtime

## Core Concepts

### Pod
- Smallest deployable unit in Kubernetes
- Contains one or more containers
- Containers share network namespace
- Usually you don't create pods directly

### Deployment
- Manages ReplicaSets and Pods
- Ensures desired number of replicas
- Handles updates and rollbacks
- Declarative updates

### Service
- Exposes pods on the network
- Provides stable IP and DNS name
- Load balances traffic
- Types: ClusterIP, NodePort, LoadBalancer

### ConfigMap
- Stores configuration data
- Non-sensitive key-value pairs
- Can be mounted as files or env vars
- Separate config from code

### Namespace
- Virtual clusters within cluster
- Organizes resources
- Resource isolation
- Default is 'default' namespace

## YAML Structure

Every Kubernetes resource has:

\\\yaml
apiVersion: v1              # API version
kind: Pod                   # Resource type
metadata:                   # Metadata
  name: my-pod
spec:                       # Specification
  containers:
  - name: app
    image: node:18-alpine
\\\

## kubectl Commands

\\\ash
# Apply manifests
kubectl apply -f pod.yaml
kubectl apply -f deployment.yaml

# View resources
kubectl get pods
kubectl get deployments
kubectl get services

# Describe resource
kubectl describe pod my-pod

# View logs
kubectl logs pod-name

# Execute in container
kubectl exec -it pod-name -- /bin/sh

# Delete resource
kubectl delete pod my-pod
\\\

## Day 11 Project Files

- **pod.yaml**: Single Pod example
- **deployment.yaml**: 3-replica Deployment
- **service.yaml**: LoadBalancer Service
- **configmap.yaml**: Configuration management
- **namespace.yaml**: Namespace organization
- **all-in-one.yaml**: Complete application

## Kubernetes vs Docker Swarm

| Feature | Kubernetes | Swarm |
|---------|-----------|-------|
| Complexity | Complex | Simple |
| Learning Curve | Steep | Gentle |
| Scalability | Enterprise-scale | Medium |
| Community | Massive | Small |
| Production | Industry standard | Less common |

## Best Practices

✅ Use Deployments (not Pods)
✅ Use Services for networking
✅ Use ConfigMaps for configuration
✅ Set resource requests and limits
✅ Use health checks
✅ Organize with namespaces
✅ Use labels for organization
✅ Keep images small and updated

## Next Steps

After Kubernetes fundamentals:
- Advanced Deployments
- StatefulSets for persistent apps
- Ingress for HTTP routing
- Persistent Volumes for data
- RBAC for security
