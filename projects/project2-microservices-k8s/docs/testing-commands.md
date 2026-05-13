# Testing Commands - Day 29

## Quick Testing

### Running Integration Tests

```bash
./integration-tests.sh
```

This script:
1. Waits for all pods to be ready
2. Sets up port forwarding
3. Tests health checks
4. Tests each service API
5. Tests inter-service communication
6. Tests complete workflow
7. Cleans up port forwarding

## Manual Testing

### Setup Port Forwarding

Terminal 1:
```bash
kubectl port-forward svc/user-service 8000:8000 -n microservices
```

Terminal 2:
```bash
kubectl port-forward svc/order-service 8001:8000 -n microservices
```

Terminal 3:
```bash
kubectl port-forward svc/payment-service 8002:8000 -n microservices
```

### Health Checks

```bash
curl http://localhost:8000/health
curl http://localhost:8001/health
curl http://localhost:8002/health
```

### User Service API

```bash
# Get all users
curl http://localhost:8000/users

# Get specific user
curl http://localhost:8000/users/1

# Create user
curl -X POST http://localhost:8000/users \
  -H "Content-Type: application/json" \
  -d '{"name":"Alice","email":"alice@example.com"}'

# Update user
curl -X PUT http://localhost:8000/users/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Alice Updated"}'

# Delete user
curl -X DELETE http://localhost:8000/users/2
```

### Order Service API

```bash
# Get all orders
curl http://localhost:8001/orders

# Get specific order
curl http://localhost:8001/orders/1001

# Get orders by user (includes user info from user-service)
curl http://localhost:8001/orders/user/1

# Create order (validates user with user-service)
curl -X POST http://localhost:8001/orders \
  -H "Content-Type: application/json" \
  -d '{"user_id":1,"items":["item1"],"total":99.99}'

# Update order
curl -X PUT http://localhost:8001/orders/1001 \
  -H "Content-Type: application/json" \
  -d '{"status":"shipped"}'

# Validate order
curl http://localhost:8001/orders/1001/validate
```

### Payment Service API

```bash
# Get all payments
curl http://localhost:8002/payments

# Get specific payment
curl http://localhost:8002/payments/p001

# Get payments for order (includes order info)
curl http://localhost:8002/payments/order/1001

# Create payment (validates order)
curl -X POST http://localhost:8002/payments \
  -H "Content-Type: application/json" \
  -d '{"order_id":1001,"amount":99.99,"method":"credit_card"}'

# Process payment
curl -X POST http://localhost:8002/payments/p001/process
```

## Kubernetes Commands

```bash
# Check pod status
kubectl get pods -n microservices

# Check service discovery
kubectl get svc -n microservices

# Check logs
kubectl logs -f deployment/order-service -n microservices

# Describe pod
kubectl describe pod <pod-name> -n microservices

# Get into pod
kubectl exec -it <pod-name> -n microservices -- /bin/sh

# Test DNS from pod
kubectl run -it --rm debug --image=busybox --restart=Never -- \
  nslookup user-service.microservices
```

## JSON Pretty Printing

```bash
# With jq
curl http://localhost:8000/users | jq .

# With Python
curl http://localhost:8000/users | python -m json.tool
```

## Advanced Testing

### Load Testing

```bash
# Using Apache Bench
ab -n 100 -c 10 http://localhost:8000/users

# Using wrk
wrk -t4 -c100 -d30s http://localhost:8000/users
```

### Latency Testing

```bash
# Measure response time
time curl http://localhost:8001/orders/user/1
```

### Error Testing

```bash
# Test with invalid user ID
curl http://localhost:8001/orders/user/999

# Test with invalid order ID
curl http://localhost:8002/payments/order/9999
```

## Debugging

### View Environment Variables

```bash
kubectl exec -it <pod-name> -n microservices -- env | grep SERVICE
```

### Check Service DNS Resolution

```bash
# From a pod
kubectl run -it --rm debug --image=busybox --restart=Never -- \
  nslookup user-service.microservices.svc.cluster.local
```

### Monitor Network Traffic

```bash
# Using tcpdump (if available)
kubectl debug <pod-name> -it -n microservices -- tcpdump -i any -n port 8000
```
