## What I Built Today
A simple Node.js application containerized with Docker.

## Dockerfile Explanation
- **FROM node:18**: Uses Node.js version 18 as base image
- **WORKDIR /app**: Sets working directory inside container
- **COPY package.json .**: Copies package.json from host to container
- **RUN npm install**: Installs dependencies inside container
- **COPY index.js .**: Copies application code
- **EXPOSE 3000**: Exposes port 3000
- **CMD ["node", "index.js"]**: Command to run when container starts

## What I Learned Today
1. How to create a Dockerfile
2. Difference between Docker image and container
3. How to build and run containers
4. Port mapping between container and host

## Key Concepts
- **Image**: Blueprint for creating containers
- **Container**: Running instance of an image
- **Dockerfile**: Text file with instructions to build an image
- **Port Mapping**: Connecting container port to host port

## Next Steps
- [ ] Learn Docker networking
- [ ] Use docker-compose for multiple containers
- [ ] Work with volumes
- [ ] Deploy to production

## Progress
- [x] Docker basics
- [x] Create first Dockerfile
- [x] Build and run container
- [ ] Docker networking
- [ ] docker-compose
- [ ] Docker volumes

## How to Run
1. Build: `docker build -t myapp:1.0 .`
2. Run: `docker run -p 3000:3000 myapp:1.0`
3. Test: Open http://localhost:3000

## Date Started
April 15, 2026
