# Day 12: Kubernetes Advanced

## Topics
- StatefulSets for stateful applications
- Persistent Volumes for data storage
- Ingress for HTTP routing
- Secrets for sensitive data

## Project Files

- **storageclass.yaml**: Define storage provisioning
- **pvc.yaml**: Persistent volume claim
- **statefulset.yaml**: Stateful Pod management
- **headless-service.yaml**: Service for StatefulSet
- **ingress.yaml**: HTTP routing
- **db-secret.yaml**: Sensitive data
- **db-configmap.yaml**: Configuration data
- **all-in-one-advanced.yaml**: Complete setup

## Key Concepts

| Concept | Purpose |
|---------|---------|
| **StatefulSet** | Manage stateful applications |
| **PersistentVolume** | Abstract storage |
| **PersistentVolumeClaim** | Request storage |
| **StorageClass** | Dynamic provisioning |
| **Ingress** | HTTP/HTTPS routing |
| **Secret** | Sensitive data storage |

## Apply Manifests

bash
kubectl apply -f all-in-one-advanced.yaml


## View Resources

bash
kubectl get pvc -n devops-lab
kubectl get statefulset -n devops-lab
kubectl get ingress -n devops-lab


## Key Commands

bash
kubectl get pvc                    # List volume claims
kubectl get pv                     # List volumes
kubectl describe pvc <name>        # PVC details
kubectl get ingress                # List Ingress rules
kubectl get statefulset            # List StatefulSets
