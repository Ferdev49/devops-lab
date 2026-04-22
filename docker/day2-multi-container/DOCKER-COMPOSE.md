# Docker Compose Learning Guide

## What is docker-compose?
docker-compose is a tool for defining and running multi-container Docker applications.
Instead of running multiple `docker run` commands, you define all services in one file.

## My docker-compose.yml Structure

### Service 1: Web Application (Node.js)
- **Image**: Built from our Dockerfile
- **Port**: 3000:3000 (accessible on http://localhost:3000)
- **Environment**: NODE_ENV=production
- **Dependencies**: Depends on Redis service

### Service 2: Redis Cache
- **Image**: redis:7-alpine (official Redis image)
- **Port**: 6379:6379 (Redis port)
- **Volume**: redis-data (persists data on disk)
- **Network**: Connected to app-network

## Key Concepts

### Volumes
- **Purpose**: Persist data even if container stops
- **Type**: Named volume (redis-data)
- **Example**: redis-data:/data (maps volume to /data in container)

### Networks
- **Purpose**: Allow services to communicate by name
- **Type**: Bridge network (app-network)
- **Benefit**: Containers can ping each other by service name (web can reach redis:6379)

### depends_on
- **Purpose**: Ensures Redis starts before Web app
- **Benefit**: Prevents connection errors due to service startup order

### restart policy
- **Purpose**: Automatically restart containers if they crash
- **Options**: no, always, unless-stopped, on-failure

## How to Use

### Start services:
```bash
docker-compose up
```

### Run in background:
```bash
docker-compose up -d
```

### Stop services:
```bash
docker-compose down
```

### View logs:
```bash
docker-compose logs
```

### View specific service logs:
```bash
docker-compose logs web
```

### Execute command in running container:
```bash
docker-compose exec redis redis-cli ping
```

## What I Learned
1. How to define multiple services in one file
2. How services communicate through networks
3. How volumes persist data
4. How depends_on manages startup order
5. How to use official images (redis:7-alpine)