Week 3: Kubernetes - Complete Summary
Overview
Two-day intensive Kubernetes container orchestration learning.
April 26-27, 2026 (Days 11-12)
Days 11-12: Kubernetes Deep Dive
Day 11: Kubernetes Fundamentals
Topics:

What is Kubernetes (k8s)
Core concepts: Pods, Deployments, Services
ConfigMaps for configuration
Namespaces for organization
YAML manifest structure
Basic kubectl commands

Project Files:

pod.yaml: Single Pod definition
deployment.yaml: Deployment with 3 replicas
service.yaml: LoadBalancer Service
configmap.yaml: Configuration management
namespace.yaml: Resource organization
all-in-one.yaml: Complete application

Key Learning:

Pods are smallest deployable units
Deployments manage Pods at scale
Services expose Pods on network
ConfigMaps decouple configuration from code
Namespaces provide logical isolation

Confidence: 85%
Day 12: Kubernetes Advanced
Topics:

StatefulSets for stateful applications
Persistent Volumes (PV) and PersistentVolumeClaims (PVC)
StorageClass for dynamic provisioning
Ingress for HTTP/HTTPS routing
Headless Services
Secrets for sensitive data

Project Files:

storageclass.yaml: Storage provisioning
pvc.yaml: Volume claim
statefulset.yaml: Stateful Pod management
headless-service.yaml: Service for StatefulSet
ingress.yaml: HTTP routing
db-secret.yaml: Sensitive data
db-configmap.yaml: Configuration data
all-in-one-advanced.yaml: Complete advanced setup

Key Learning:

StatefulSets manage persistent Pod identity
PV/PVC provide persistent storage
Ingress routes HTTP traffic
Secrets store sensitive data securely
Headless Services for StatefulSet networking

Confidence: 80%
Statistics
MetricValueDays2Projects2YAML Files12+Documentation4 filesCommits2+Topics8+
Key Services & Concepts
ConceptPurposePodSmallest unit, contains containersDeploymentManages Pods at scaleServiceExposes Pods on networkConfigMapConfiguration storageSecretSensitive data storageStatefulSetManage stateful applicationsPersistentVolumeAbstract storageIngressHTTP/HTTPS routing
Kubernetes vs Docker Swarm
FeatureKubernetesDocker SwarmComplexityComplexSimpleScalabilityEnterpriseMediumCommunityMassiveSmallProductionIndustry standardLess common
Architecture Patterns
Stateless Application (Deployment)

Web servers
API services
Multiple replicas
Easy to scale

Stateful Application (StatefulSet)

Databases
Message queues
Cache servers
Persistent storage required

Best Practices Implemented
✅ Use Deployments (not raw Pods)
✅ Set resource requests and limits
✅ Implement health checks
✅ Use ConfigMaps for configuration
✅ Use Secrets for sensitive data
✅ Organize with namespaces
✅ Use labels for organization
✅ Declarative YAML manifests
Common kubectl Commands
bashkubectl apply -f manifest.yaml       # Create/update
kubectl get pods                     # List pods
kubectl describe pod <name>          # Details
kubectl logs <pod>                   # View logs
kubectl exec -it <pod> -- /bin/sh   # Execute in pod
kubectl delete pod <name>            # Delete
kubectl scale deployment --replicas=5 # Scale
Storage Considerations
Ephemeral Storage

Pods deleted = data lost
Good for: Caches, temp files
Example: Web server

Persistent Storage

Data survives Pod deletion
Good for: Databases, important data
Example: PostgreSQL with PVC

Networking
ClusterIP Service (Default)

Internal only
Service discovery within cluster
DNS: service-name.namespace.svc.cluster.local

LoadBalancer Service

External access
Cloud provider load balancer
For: Public APIs, web apps

Ingress

HTTP/HTTPS routing
Host/path based routing
For: Multiple services on one IP

Lessons Learned

Kubernetes is powerful - Automates most container operations
YAML is the language - Everything defined declaratively
Services enable networking - Pods ephemeral, services stable
ConfigMaps separate concerns - Configuration from code
Persistence requires planning - Data storage is critical
kubectl is essential - Must-know command line tool
Declarative > Imperative - Desired state management

Next Steps
Week 4: AWS (Days 13-20)

AWS Fundamentals
AWS Advanced Services
Solutions Architect Exam Prep

Integration: Docker containers run in Kubernetes, deployed on AWS
Week 3 Summary
✅ Kubernetes fundamentals mastered
✅ Advanced concepts understood
✅ Real-world patterns learned
✅ Production-ready deployments
✅ Ready for AWS integration
Total Week 3: 2 days, 2 projects, 85% confidence level