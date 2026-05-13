# Service Communication - Day 29

## Overview

Microservices communicate with each other using Kubernetes Service DNS.

## Service Discovery

### DNS Names in Kubernetes

Services are accessible via DNS:
- Short name (same namespace): `service-name:port`
- Full name: `service-name.namespace.svc.cluster.local:port`

Example:
user-service:8000
user-service.microservices.svc.cluster.local:8000

## Inter-Service Communication Patterns

### Synchronous (Request-Response)

Order Service calls User Service to validate user:

```python
import requests

USER_SERVICE_URL = "http://user-service:8000"
response = requests.get(f"{USER_SERVICE_URL}/users/{user_id}")
user_data = response.json()
```

### Asynchronous (Event-Driven)

Not implemented yet, but would use message queues (RabbitMQ, Kafka).

## Current Implementation

### Order Service → User Service

```text
Order Service validates users exist:
POST /orders
├─ Receive order request
├─ Get user_id from request
├─ Call User Service: GET /users/{user_id}
├─ Validate user exists
└─ Create order if valid
```

### Payment Service → Order Service

```text
Payment Service validates orders exist:
POST /payments
├─ Receive payment request
├─ Get order_id from request
├─ Call Order Service: GET /orders/{order_id}
├─ Validate order exists
├─ Create payment if valid
└─ Update order status
```

## Network Communication
```text
Pod (Order Service)
↓
Kubernetes DNS
↓
Service (user-service:8000)
↓
Pod (User Service)
```

## Failure Handling

Services handle communication failures gracefully:

```python
try:
    response = requests.get(url, timeout=5)
    if response.status_code == 200:
        return response.json()
    else:
        return error
except Exception as e:
    return error
```

## Timeouts

All requests have 5-second timeout to prevent hanging.

## Security Considerations

### Network Policies (Optional)

Could be implemented to restrict traffic:
- Only allow Order Service to call User Service
- Only allow Payment Service to call Order Service
- Block external traffic

### Service-to-Service Authentication

Not implemented but could use:
- Mutual TLS (mTLS)
- API Keys
- OAuth2

## Testing Service Communication

### From Pod

```bash
# Get shell in pod
kubectl exec -it <pod-name> -n microservices -- /bin/sh

# Test service discovery
curl http://user-service:8000/health
nslookup user-service

# Check environment variables
env | grep SERVICE
```

### Port Forwarding

```bash
# Forward local port to service
kubectl port-forward svc/user-service 8000:8000 -n microservices

# Test locally
curl http://localhost:8000/health
```

## Complete Flow Example
```text
User creates order for user_id=1:
↓
Order Service
├─ Receives POST /orders
├─ Calls GET /users/1 → User Service
│  └─ ✅ User found
├─ Creates order
└─ Returns order data
User pays for order_id=1001:
↓
Payment Service
├─ Receives POST /payments
├─ Calls GET /orders/1001 → Order Service
│  ├─ ✅ Order found
│  └─ Calls GET /users/1 → User Service (from Order Service)
├─ Creates payment
├─ Calls PUT /orders/1001 → Order Service
│  └─ Updates status to "paid"
└─ Returns payment data
```

## Metrics to Monitor

- Request latency (between services)
- Error rates (failed calls)
- Service availability
- Network bandwidth
- Connection pool usage

## Best Practices

```text
✅ Always use service names, not IP addresses
✅ Implement timeouts on all requests
✅ Handle failures gracefully (circuit breaker)
✅ Log all inter-service calls
✅ Monitor service communication metrics
✅ Use health checks to detect failures
✅ Document service dependencies
✅ Test communication paths
```
