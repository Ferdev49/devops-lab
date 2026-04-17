# Docker Learning Path

## Overview
Docker fundamentals and containerization learning materials.

## Sections
- **basics/**: Docker basics (Dockerfile, images, containers)
- **compose/**: docker-compose for multi-container applications
- **advanced/**: Advanced Docker concepts (networking, volumes, health checks)

## Progress
- [x] Day 1: Docker Basics - Simple Dockerfile with Node.js
- [x] Day 2: Docker Compose - Multi-container with Node.js + Redis
- [x] Day 3: Advanced Docker - 3-Container app with networking and volumes
- [ ] Docker Networking Deep Dive
- [ ] Docker Security Best Practices
- [ ] Docker Optimization

## Key Learnings

### Day 1: Dockerfile Fundamentals
- Dockerfile syntax and structure
- Base images (node:18)
- COPY, RUN, EXPOSE, CMD commands
- Building images with docker build
- Running containers with docker run
- Port mapping (3000:3000)

### Day 2: docker-compose Multi-Container
- docker-compose.yml structure
- Defining multiple services
- Service communication via networks
- Named volumes for persistence
- depends_on for startup order
- restart policies

### Day 3: Advanced Networking & Volumes
- Custom bridge networks
- Service discovery via DNS
- Container-to-container communication
- Named volumes vs bind mounts
- Data persistence strategies
- Health checks (HTTP, TCP, command-based)

## Architecture Evolution

### Day 1: Single Container
\\\
┌─────────────────┐
│  Node.js App    │
│  (port 3000)    │
└─────────────────┘
\\\

### Day 2: Two Services
\\\
┌──────────────────────────────┐
│  Docker Network              │
│  ┌──────────┐  ┌──────────┐ │
│  │ Node App │──│  Redis   │ │
│  │ :3000    │  │  :6379   │ │
│  └──────────┘  └──────────┘ │
└──────────────────────────────┘
\\\

### Day 3: Three Services
\\\
┌─────────────────────────────────────┐
│  Docker Network with Volumes        │
│  ┌────────┐ ┌────────┐ ┌─────────┐ │
│  │ Node   │─│ Redis  │ │ Postgres│ │
│  │ :3000  │ │ :6379  │ │ :5432  │ │
│  └────────┘ └──┬─────┘ └────┬────┘ │
│              │              │      │
│         ┌────▼──┐     ┌────▼────┐  │
│         │redis- │     │postgres-│  │
│         │data   │     │data     │  │
│         └───────┘     └─────────┘  │
└─────────────────────────────────────┘
\\\

## Technologies Used
- Docker & docker-compose
- Node.js
- Redis (in-memory cache)
- PostgreSQL (relational database)
- YAML (docker-compose syntax)
- Bash/Shell scripts

## How to Navigate
1. **basics/**: Start here for Docker fundamentals
2. **compose/**: Learn multi-container orchestration
3. **advanced/**: Understand networking and persistence
4. See README.md in each folder for specific details

## Next Steps
- Docker security and best practices
- Docker image optimization
- Advanced networking scenarios
- Integration with Kubernetes (Week 3-4)
