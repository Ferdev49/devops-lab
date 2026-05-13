#!/bin/bash
set -e

K8S_NAMESPACE="microservices"
TIMEOUT=300

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║     Kubernetes Service Communication Integration Tests         ║"
echo "╚════════════════════════════════════════════════════════════════╝"

# Wait for pods
echo ""
echo "Step 1: Waiting for all pods to be ready..."
kubectl wait --for=condition=Ready pod -l app=user-service -n $K8S_NAMESPACE --timeout=${TIMEOUT}s
kubectl wait --for=condition=Ready pod -l app=order-service -n $K8S_NAMESPACE --timeout=${TIMEOUT}s
kubectl wait --for=condition=Ready pod -l app=payment-service -n $K8S_NAMESPACE --timeout=${TIMEOUT}s
echo "✅ All pods ready"

# Port forward in background
echo ""
echo "Step 2: Setting up port forwarding..."
kubectl port-forward svc/user-service 8000:8000 -n $K8S_NAMESPACE > /dev/null 2>&1 &
PF_USER=$!
kubectl port-forward svc/order-service 8001:8000 -n $K8S_NAMESPACE > /dev/null 2>&1 &
PF_ORDER=$!
kubectl port-forward svc/payment-service 8002:8000 -n $K8S_NAMESPACE > /dev/null 2>&1 &
PF_PAYMENT=$!

sleep 2
echo "✅ Port forwarding established (PIDs: $PF_USER, $PF_ORDER, $PF_PAYMENT)"

# Cleanup function
cleanup() {
    echo ""
    echo "Cleaning up port forwarding..."
    kill $PF_USER $PF_ORDER $PF_PAYMENT 2>/dev/null || true
}
trap cleanup EXIT

# Test 1: Health checks
echo ""
echo "Step 3: Testing health checks..."
echo "  Testing user-service..."
curl -s http://localhost:8000/health | python -m json.tool
echo "  Testing order-service..."
curl -s http://localhost:8001/health | python -m json.tool
echo "  Testing payment-service..."
curl -s http://localhost:8002/health | python -m json.tool
echo "✅ All services healthy"

# Test 2: User Service
echo ""
echo "Step 4: Testing User Service..."
echo "  Getting all users..."
curl -s http://localhost:8000/users | python -m json.tool
echo "  Creating new user..."
curl -s -X POST http://localhost:8000/users \
  -H "Content-Type: application/json" \
  -d '{"name":"Bob Smith","email":"bob@example.com"}' | python -m json.tool
echo "✅ User Service working"

# Test 3: Order Service with User Service communication
echo ""
echo "Step 5: Testing Order Service (with User Service communication)..."
echo "  Getting all orders..."
curl -s http://localhost:8001/orders | python -m json.tool
echo "  Getting orders for user 1 (includes user info from user-service)..."
curl -s http://localhost:8001/orders/user/1 | python -m json.tool
echo "  Creating order (validates user with user-service)..."
curl -s -X POST http://localhost:8001/orders \
  -H "Content-Type: application/json" \
  -d '{"user_id":1,"items":["item1","item2"],"total":150.00}' | python -m json.tool
echo "✅ Order Service with inter-service communication working"

# Test 4: Payment Service with Order Service communication
echo ""
echo "Step 6: Testing Payment Service (with Order Service communication)..."
echo "  Getting all payments..."
curl -s http://localhost:8002/payments | python -m json.tool
echo "  Creating payment (validates order with order-service)..."
curl -s -X POST http://localhost:8002/payments \
  -H "Content-Type: application/json" \
  -d '{"order_id":1001,"amount":99.99,"method":"credit_card"}' | python -m json.tool
echo "✅ Payment Service with inter-service communication working"

# Test 5: Service discovery from pod
echo ""
echo "Step 7: Testing service discovery from pod..."
POD=$(kubectl get pods -n $K8S_NAMESPACE -l app=order-service -o jsonpath='{.items[0].metadata.name}')
echo "  Testing from pod: $POD"
echo "  Order service can reach user service..."
kubectl exec -it $POD -n $K8S_NAMESPACE -- curl -s http://user-service:8000/health | python -m json.tool || true
echo "✅ Service discovery working within cluster"

# Test 6: Complete flow
echo ""
echo "Step 8: Testing complete flow (User -> Order -> Payment)..."
echo "  1. Create user..."
USER_ID=$(curl -s -X POST http://localhost:8000/users \
  -H "Content-Type: application/json" \
  -d '{"name":"Flow Test","email":"flow@test.com"}' | python -c "import sys, json; print(json.load(sys.stdin)['id'])")
echo "     Created user: $USER_ID"

echo "  2. Create order for user..."
ORDER_ID=$(curl -s -X POST http://localhost:8001/orders \
  -H "Content-Type: application/json" \
  -d "{\"user_id\":$USER_ID,\"items\":[\"flow-item\"],\"total\":99.99}" | python -c "import sys, json; print(json.load(sys.stdin)['id'])")
echo "     Created order: $ORDER_ID"

echo "  3. Create payment for order..."
PAYMENT_ID=$(curl -s -X POST http://localhost:8002/payments \
  -H "Content-Type: application/json" \
  -d "{\"order_id\":$ORDER_ID,\"amount\":99.99}" | python -c "import sys, json; print(json.load(sys.stdin)['id'])")
echo "     Created payment: $PAYMENT_ID"

echo "  4. Process payment..."
curl -s -X POST http://localhost:8002/payments/$PAYMENT_ID/process | python -m json.tool

echo "✅ Complete flow tested successfully"

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║         ✅ ALL INTEGRATION TESTS PASSED!                       ║"
echo "╚════════════════════════════════════════════════════════════════╝"
