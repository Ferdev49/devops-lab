# Testing Guide - Day 28

## API Testing Endpoints

### User Service (Port 8000 in K8s, 5000 locally)

```bash
# Health check
curl http://localhost:8000/health

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

### Order Service (Port 8001 in K8s, 5001 locally)

```bash
# Health check
curl http://localhost:8001/health

# Get all orders
curl http://localhost:8001/orders

# Get specific order
curl http://localhost:8001/orders/1001

# Get orders by user
curl http://localhost:8001/orders/user/1

# Create order
curl -X POST http://localhost:8001/orders \
  -H "Content-Type: application/json" \
  -d '{"user_id":1,"items":["item1","item2"],"total":99.99}'

# Update order
curl -X PUT http://localhost:8001/orders/1001 \
  -H "Content-Type: application/json" \
  -d '{"status":"shipped"}'
```

### Payment Service (Port 8002 in K8s, 5002 locally)

```bash
# Health check
curl http://localhost:8002/health

# Get all payments
curl http://localhost:8002/payments

# Get specific payment
curl http://localhost:8002/payments/p001

# Create payment
curl -X POST http://localhost:8002/payments \
  -H "Content-Type: application/json" \
  -d '{"order_id":1001,"amount":99.99,"method":"credit_card"}'

# Process payment
curl -X POST http://localhost:8002/payments/p001/process
```

## Load Testing

### Using Apache Bench

```bash
# Install (on macOS)
brew install httpd

# Single request
ab -n 1 -c 1 http://localhost:8000/health

# 100 requests, 10 concurrent
ab -n 100 -c 10 http://localhost:8000/users
```

### Using curl in loop

```bash
# 10 requests to user service
for i in {1..10}; do
  curl -s http://localhost:8000/users | jq .
done
```

## Kubernetes Testing

### Test Service Discovery

```bash
# Run a test pod
kubectl run -it --rm debug --image=curlimages/curl --restart=Never -n microservices -- sh

# Inside pod, test service discovery
curl http://user-service:8000/health
curl http://order-service:8000/health
curl http://payment-service:8000/health
```

### Test Pod Connectivity

```bash
# Get pod name
POD=$(kubectl get pods -n microservices -l app=user-service -o jsonpath='{.items[0].metadata.name}')

# Exec into pod
kubectl exec -it $POD -n microservices -- /bin/sh

# Inside pod
curl http://localhost:5000/health
```

## Monitoring Commands

```bash
# Watch pods
kubectl get pods -n microservices --watch

# Watch deployments
kubectl get deployments -n microservices --watch

# Get resource usage
kubectl top pods -n microservices

# Describe deployment
kubectl describe deployment user-service -n microservices
```

## Performance Metrics

Expected performance:
- Health checks: <50ms
- User list: <100ms
- Create user: <150ms
- Database operations: <200ms

If slower, check:
- Pod resource limits
- Network latency
- Service discovery resolution time
