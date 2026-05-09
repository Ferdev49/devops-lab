# Project 2: Microservices with Kubernetes

Today I'm starting my second major project: microservices with Kubernetes. Instead of one monolithic application, I'm building multiple independent services. Each service handles one business function. For example, a user service manages user data, an order service manages orders, and a payment service handles payments. Each service runs in its own Docker container and communicates via APIs. Kubernetes orchestrates these containers, manages deployments, and handles scaling. I want to practice explaining microservices architecture and discuss the benefits compared to monolithic design."

## Overview

Production-ready microservices architecture with Docker & Kubernetes.

**Status:** Day 26 - Foundation Phase
**Expected Completion:** Day 30
**Architecture:** 3 Independent Microservices on Kubernetes

## Project Structure
```text
project2-microservices-k8s/
├── services/
│   ├── user-service/
│   │   ├── main.py (Flask app)
│   │   ├── requirements.txt
│   │   └── Dockerfile
│   ├── order-service/
│   │   ├── main.py
│   │   ├── requirements.txt
│   │   └── Dockerfile
│   └── payment-service/
│       ├── main.py
│       ├── requirements.txt
│       └── Dockerfile
├── kubernetes/
│   ├── user-service-deployment.yaml
│   ├── order-service-deployment.yaml
│   ├── payment-service-deployment.yaml
│   ├── user-service-service.yaml
│   ├── order-service-service.yaml
│   ├── payment-service-service.yaml
│   └── namespace.yaml
├── docker-compose.yml
├── docs/
│   └── ARCHITECTURE.md
└── README.md
```

## 5-Day Implementation Plan

### Day 26 (Today): Foundation
- [x] Docker setup for 3 services
- [x] docker-compose for local testing
- [ ] TODO: Test docker-compose

### Day 27: Kubernetes Setup
- [ ] Create Kubernetes manifests
- [ ] Deployments for each service
- [ ] Services (ClusterIP, LoadBalancer)

### Day 28: Service Communication
- [ ] Service discovery setup
- [ ] Inter-service API calls
- [ ] ConfigMaps for configuration

### Day 29: Advanced Kubernetes
- [ ] Horizontal Pod Autoscaling
- [ ] Health checks & liveliness
- [ ] Resource limits

### Day 30: Monitoring & Integration
- [ ] Prometheus metrics
- [ ] Grafana dashboards
- [ ] Complete testing

## Microservices Overview

### User Service (Port 5000)
- Manage users
- CRUD operations
- GET /users
- POST /users

### Order Service (Port 5001)
- Manage orders
- CRUD operations
- GET /orders
- POST /orders
- GET /orders/user/<user_id>

### Payment Service (Port 5002)
- Manage payments
- Payment processing
- GET /payments
- POST /payments
- POST /payments/<id>/process

## Getting Started (Local Testing)

```bash
# Build and run with docker-compose
docker-compose up -d

# Test services
curl http://localhost:5000/health
curl http://localhost:5001/health
curl http://localhost:5002/health

# Get all users
curl http://localhost:5000/users

# Get all orders
curl http://localhost:5001/orders

# Stop services
docker-compose down
```

## Benefits of Microservices

✅ Independent deployment
✅ Technology diversity
✅ Easy scaling per service
✅ Fault isolation
✅ Team autonomy

## Kubernetes Deployment Benefits

✅ Automatic scaling
✅ Self-healing
✅ Rolling updates
✅ Service discovery
✅ Load balancing

## Success Criteria

✅ All 3 services containerized
✅ docker-compose working locally
✅ All services respond to health checks
✅ Services communicate via APIs
✅ Kubernetes deployment successful
✅ Load balancing configured
✅ Auto-scaling functional

## Next Steps

After Day 30:
- Week 7-8: CI/CD Pipeline & Job Search
