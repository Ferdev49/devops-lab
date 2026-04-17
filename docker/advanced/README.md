# Docker Advanced - 3 Container Application

## Day 3: Three-Container Architecture

### Services
1. **Node.js Web Application** (port 3000)
   - HTTP server
   - Connects to Redis and PostgreSQL
   - Health checks enabled

2. **Redis Cache** (port 6379)
   - In-memory cache
   - Persistent volume (redis-data)
   - Health checks enabled

3. **PostgreSQL Database** (port 5432)
   - Relational database
   - Persistent volume (postgres-data)
   - Health checks enabled

### Networking
- All services on custom bridge network (three-tier-network)
- Service-to-service communication by name (web → redis:6379)
- External access via port mapping

### How to Run
\\\ash
cd day3-three-container
docker-compose build
docker-compose up
curl http://localhost:3000
\\\

### Verify Services
\\\ash
# Check all containers running
docker-compose ps

# View logs
docker-compose logs

# Test Redis connection
docker-compose exec web redis-cli -h redis ping

# Test Database connection
docker-compose exec web psql -h db -U postgres -d myapp -c "SELECT NOW()"
\\\

### Key Learning
- Docker networking with custom bridge networks
- Service discovery and DNS resolution
- Volume persistence for data
- Health checks for service readiness
- Multi-service orchestration with docker-compose

### Architectures Compared
- Day 1: Single container (Node app only)
- Day 2: Two containers (Node + Redis)
- Day 3: Three containers (Node + Redis + PostgreSQL) with networking & volumes
