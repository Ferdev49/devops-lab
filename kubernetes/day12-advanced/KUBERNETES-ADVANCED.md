# Kubernetes Advanced - Day 12

## StatefulSets

StatefulSets manage stateful applications where Pods need:
- Stable network identity
- Persistent storage
- Ordered scaling
- Ordered updates

### vs Deployments
- Deployments: Stateless apps (web servers)
- StatefulSets: Stateful apps (databases, caches)

Each Pod gets stable hostname: pod-0.service, pod-1.service, etc.

## Persistent Volumes (PV)

Storage abstraction that decouples storage from Pods.

### PV Lifecycle
1. Administrator provisions storage
2. Developer claims storage with PVC
3. Pod uses PVC in volumeMount
4. When Pod deleted, data persists

### Access Modes
- ReadWriteOnce (RWO): Single Pod read-write
- ReadOnlyMany (ROX): Many Pods read-only
- ReadWriteMany (RWX): Many Pods read-write

## Persistent Volume Claims (PVC)

Request for storage by developers. PVC binds to PV.

## StorageClass

Enables dynamic provisioning of storage.

## Ingress

Routes HTTP/HTTPS traffic to Services.

### Features
- Host-based routing
- Path-based routing
- TLS/SSL termination
- Load balancing

## Secrets

Store sensitive data (passwords, tokens, certificates).

### Types
- Opaque: Default, arbitrary data
- kubernetes.io/service-account-token: Service account token
- kubernetes.io/dockercfg: Serialized Docker config
- kubernetes.io/basic-auth: Basic authentication
- kubernetes.io/ssh-auth: SSH authentication

## Day 12 Project Structure

- storageclass.yaml: Define storage type
- pvc.yaml: Request storage
- statefulset.yaml: Manage stateful Pods
- headless-service.yaml: For StatefulSet networking
- ingress.yaml: Route HTTP traffic
- db-secret.yaml: Sensitive data
- db-configmap.yaml: Non-sensitive config
- all-in-one-advanced.yaml: Complete setup

## kubectl Commands for Advanced

Run these commands:

  kubectl get pvc                    # List volume claims
  kubectl get pv                     # List volumes
  kubectl describe pvc name          # PVC details
  kubectl get ingress                # List Ingress rules
  kubectl get statefulset            # List StatefulSets
  kubectl describe statefulset name  # StatefulSet details

## Key Differences from Day 11

| Aspect | Day 11 | Day 12 |
|--------|--------|--------|
| Workload | Stateless | Stateful |
| Storage | Ephemeral | Persistent |
| Identity | Replaceable | Stable |
| Use Case | Web apps | Databases |

## Next Steps

Day 13+: AWS integration and Solutions Architect exam prep
