# Docker Networking Deep Dive

## What is Docker Networking?
Docker networking allows containers to communicate with each other and with the host system.

## Types of Networks

### 1. Bridge Network (Default)
- Isolated network for container communication
- Used in docker-compose automatically
- Containers reach each other by service name (DNS resolution)
- Example: web can reach redis:6379

### 2. Host Network
- Container shares host network stack
- No isolation
- Performance: Higher
- Use case: High-performance applications

### 3. Overlay Network
- Used in Docker Swarm for multi-host communication
- Advanced topic (future learning)

## My Three-Container Architecture

\\\
┌─────────────────────────────────────────┐
│        Docker Bridge Network            │
│     (three-tier-network)                │
│                                         │
│  ┌──────────┐  ┌────────┐  ┌─────────┐│
│  │  web     │  │ redis  │  │   db    ││
│  │:3000     │  │:6379   │  │:5432   ││
│  │(Node.js) │  │(Redis) │  │(Postgres)│
│  └─────┬────┘  └───┬────┘  └────┬────┘│
│        │           │            │     │
│        └───────────┼────────────┘     │
│                    │                  │
│         Service Discovery (DNS)       │
│   (resolution by service name)        │
│                                       │
└─────────────────────────────────────────┘
\\\

## Service Communication

### How Web reaches Redis:
- In docker-compose.yml: redis service name is 'redis'
- In Node.js: connect to 'redis:6379' (NOT localhost:6379)
- Docker DNS resolves 'redis' → internal IP of redis container

### How Web reaches PostgreSQL:
- In docker-compose.yml: db service name is 'db'
- In Node.js: connect to 'db:5432' (NOT localhost:5432)
- Docker DNS resolves 'db' → internal IP of postgres container

## Key Networking Concepts

### 1. Custom Bridge Network
- User-defined bridge network (three-tier-network)
- Automatic DNS resolution by service name
- Better than default bridge (more control)
- Allows services to communicate

### 2. depends_on
- Ensures startup order
- redis and db start before web
- web waits for dependencies

### 3. healthcheck
- Monitors container health
- Web: HTTP check every 10s
- Redis: PING check every 5s
- DB: pg_isready check every 10s
- Ensures services are ready before web tries to connect

### 4. Volumes
- Redis: redis-data (persists cache)
- PostgreSQL: postgres-data (persists database)
- Data survives container restart

## Port Mapping vs Internal Communication

### Port Mapping (from outside containers):
- Host: 3000 → Container: 3000 (access from browser: localhost:3000)
- Host: 6379 → Container: 6379 (access from host redis-cli)
- Host: 5432 → Container: 5432 (access from host psql)

### Internal Communication (between containers):
- web → redis:6379 (not localhost:6379)
- web → db:5432 (not localhost:5432)
- Uses Docker's internal DNS resolution

## Useful docker-compose Networking Commands

\\\ash
# View networks
docker network ls

# View specific network details
docker network inspect three-tier-network

# Test connectivity between containers
docker-compose exec web ping redis
docker-compose exec web ping db

# Check DNS resolution
docker-compose exec web nslookup redis
docker-compose exec web nslookup db
\\\

## Lessons Learned
1. Containers need to use service names, not localhost
2. docker-compose creates a custom bridge network automatically
3. DNS resolution makes service discovery automatic
4. healthchecks ensure services are ready before dependent services connect
5. Volume mounts persist data beyond container lifetime
