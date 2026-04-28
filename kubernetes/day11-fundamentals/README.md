# Kubernetes Learning Path

## Overview
Introduction to Kubernetes container orchestration platform.

## Day 11: Kubernetes Fundamentals

### Topics Covered
- What is Kubernetes (k8s)
- Core concepts: Pods, Deployments, Services
- ConfigMaps for configuration
- Namespaces for organization
- YAML manifest structure
- Basic kubectl commands

### Project Files

#### pod.yaml
Single Pod definition (learning only, not for production)

#### deployment.yaml
Deployment with 3 replicas managing Pods

#### service.yaml
LoadBalancer Service exposing Deployment

#### configmap.yaml
Configuration data management

#### namespace.yaml
Namespace for resource organization

#### all-in-one.yaml
Complete application with Namespace, ConfigMap, Deployment, and Service

### Key Concepts

**Pod**: Smallest unit, contains containers
**Deployment**: Manages Pods at scale
**Service**: Exposes Pods on network
**ConfigMap**: Configuration without hardcoding
**Namespace**: Logical resource grouping

### kubectl Commands

\\\Bash
kubectl apply -f pod.yaml
kubectl get pods
kubectl describe pod <name>
kubectl logs <pod-name>
kubectl delete pod <name>
\\\

### Architecture

```text
Kubernetes Cluster
└── Namespace: devops-lab
    ├── Deployment (3 replicas)
    │   ├── Pod 1
    │   ├── Pod 2
    │   └── Pod 3
    ├── Service (LoadBalancer)
    │   └── Routes traffic to Pods
    └── ConfigMap
        └── Shared configuration
```

### Learning Journey
Day 11: Start Kubernetes fundamentals
Next: Advanced deployments and networking

### Resources
- KUBERNETES-BASICS.md: Comprehensive guide
- *.yaml files: Manifest examples
