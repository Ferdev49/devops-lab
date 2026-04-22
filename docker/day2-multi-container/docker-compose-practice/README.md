## Day 2: Docker Compose

### What I Built
A multi-container application with:
- Node.js web application
- Redis cache database
- Defined in docker-compose.yml

### Services
1. **web**: Node.js HTTP server on port 3000
2. **redis**: Redis cache on port 6379

### Key Learning
- How to use docker-compose.yml for multi-container apps
- How services communicate through networks
- How to use volumes for data persistence
- How depends_on manages service startup order

### Run the Application
```bash
cd docker-compose-practice
docker-compose up
# Access: http://localhost:3000
```

### Files Created
- docker-compose.yml (main configuration)
- Dockerfile (for web service)
- app.js (Node.js application)
- package.json (dependencies)