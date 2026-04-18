# Docker Advanced - Security & Optimization

## Day 3: Three-Container Architecture with Networking

### Services
1. **Node.js Web Application** (port 3000)
2. **Redis Cache** (port 6379)

### Key Concepts
- Docker networking with custom bridge networks
- Service discovery and DNS resolution
- Volume persistence for data
- Health checks for service readiness

---

## Day 4: Security & Optimization

### Security Features Implemented
- Non-root user (nodejs with UID 1001)
- Read-only filesystem
- Minimal base image (alpine)
- Multi-stage build
- Dropped unnecessary capabilities
- Health checks enabled

### Optimizations
- Multi-stage build: 950MB → 180MB
- Alpine base image (~180MB vs ~900MB)
- .dockerignore file
- Layer caching strategy

### How to Run

Day 3 (Networking):
\\\ash
cd day3-three-container
docker-compose up
\\\

Day 4 (Security):
\\\ash
cd day4-security-optimization
docker-compose up
\\\

### Security Checklist
- [x] Non-root user
- [x] Read-only filesystem
- [x] Minimal base image
- [x] Multi-stage build
- [x] .dockerignore
- [x] Health checks
- [x] Drop capabilities
- [ ] Image scanning
- [ ] Secrets management

### Architecture Evolution
- Day 1: Single container
- Day 2: Two containers (Node + Redis)
- Day 3: Three containers with networking
- Day 4: Secure and optimized containers

### Next Steps
- Image vulnerability scanning
- Docker Swarm basics
- Transition to Kubernetes (Week 3-4)
