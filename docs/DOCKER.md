# Docker Setup Guide

## Day 1: Simple Application

### What I Built
A simple Node.js application containerized with Docker.

### Dockerfile Explanation
- **FROM node:18**: Uses Node.js version 18 asbase image
- **WORKDIR /app**: Sets working directory inside container
- **COPY package.json .**: Copies package.json from host to container
- **RUN npm install**: Installs dependencies inside container
- **COPY index.js .**: Copies application code
- **EXPOSE 3000**: Exposes port 3000
- **CMD ["node", "index.js"]**: Command to run when container starts

### How to Run
1. Build: docker build -t myapp:1.0 .
2. Run: docker run -p 3000:3000 myapp:1.0
3. Test: Open http://localhost:3000

### What I Learned
- How to containerize a Node.js application
- Dockerfile syntax basics
- Difference between image and container

---

## Day 2: Docker Compose

### What is docker-compose?
docker-compose is a tool for defining and running multi-container Docker applications.
Instead of running multiple docker run commands, you define all services in one file.

### docker-compose.yml Structure

#### Service 1: Web Application (Node.js)
- **Image**: Built from our Dockerfile
- **Port**: 3000:3000 (accessible on http://localhost:3000)
- **Environment**: NODE_ENV=production
- **Dependencies**: Depends on Redis service

#### Service 2: Redis Cache
- **Image**: redis:7-alpine (official Redis image)
- **Port**: 6379:6379 (Redis port)
- **Volume**: redis-data (persists data on disk)
- **Network**: Connected to app-network

### Key Concepts

#### Volumes
- **Purpose**: Persist data even if container stops
- **Type**: Named volume (redis-data)
- **Example**: redis-data:/data (maps volume to /data in container)

#### Networks
- **Purpose**: Allow services to communicate by name
- **Type**: Bridge network (app-network)
- **Benefit**: Containers can ping each other by service name (web can reach redis:6379)

#### depends_on
- **Purpose**: Ensures Redis starts before Web app
- **Benefit**: Prevents connection errors due to service startup order

#### restart policy
- **Purpose**: Automatically restart containers if they crash
- **Options**: no, always, unless-stopped, on-failure

### How to Use

#### Start services:
\\\Bash
docker-compose up
\\\

#### Run in background:
\\\Bash
docker-compose up -d
\\\

#### Stop services:
\\\Bash
docker-compose down
\\\

#### View logs:
\\\Bash
docker-compose logs
\\\

#### View specific service logs:
\\\Bash
docker-compose logs web
\\\

#### Execute command in running container:
\\\Bash
docker-compose exec redis redis-cli ping
\\\

### What I Learned
1. How to define multiple services in one file
2. How services communicate through networks
3. How volumes persist data
4. How depends_on manages startup order
5. How to use official images (redis:7-alpine)
