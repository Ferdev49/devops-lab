# Kubernetes Learning Path

## Overview
Container orchestration platform mastery. Week 3-4 focus.

## Day 11: Kubernetes Fundamentals ✅
**Topics:** Pods, Deployments, Services, ConfigMaps, Namespaces

**Project Files:**
- pod.yaml - Single Pod example
- deployment.yaml - Deployment with 3 replicas
- service.yaml - LoadBalancer Service
- configmap.yaml - Configuration data
- 
amespace.yaml - Resource organization
- all-in-one.yaml - Complete application

## Key Concepts

| Concept | Purpose |
|---------|---------|
| **Pod** | Smallest unit, contains containers |
| **Deployment** | Manages Pods at scale |
| **Service** | Exposes Pods on network |
| **ConfigMap** | Configuration data |
| **Namespace** | Resource organization |

## Quick Start

\\\Bash
# Apply manifests
kubectl apply -f all-in-one.yaml

# View resources
kubectl get pods -n devops-lab
kubectl get deployments -n devops-lab
kubectl get services -n devops-lab

# Describe resource
kubectl describe deployment devops-lab-deployment -n devops-lab

# View logs
kubectl logs <pod-name> -n devops-lab
\\\

## kubectl Commands Cheat Sheet

\\\Bash
kubectl apply -f manifest.yaml          # Create/update resources
kubectl get pods                        # List pods
kubectl describe pod <n>             # Show details
kubectl logs <pod>                      # View logs
kubectl exec -it <pod> -- /bin/sh       # Execute in pod
kubectl delete pod <n>               # Delete resource
kubectl scale deployment --replicas=5   # Scale
\\\

## Architecture

```text
Namespace: devops-lab
├─ Deployment (3 replicas)
│  ├─ Pod 1
│  ├─ Pod 2
│  └─ Pod 3
├─ Service (LoadBalancer)
└─ ConfigMap
```

## Best Practices

✅ Use Deployments (not raw Pods)
✅ Set resource requests & limits
✅ Implement health checks
✅ Use ConfigMaps for config
✅ Organize with namespaces

## Next Steps

- Day 12: Advanced Kubernetes
- Days 13-20: AWS & Exam prep
- Week 5-6: Portfolio projects
