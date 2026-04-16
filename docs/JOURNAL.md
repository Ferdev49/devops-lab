# My Docker Learning Journey - Journal

## Day 1 - Wednesday, April 15, 2026

### What I Learned Today
1. Understood what Docker is and why it's useful
2. Learned how to write a basic Dockerfile
3. Successfully built and ran my first Docker container
4. Understood the difference between images and containers

### What Was Difficult
- Understanding the Dockerfile syntax at first
- Remembering all the different commands (COPY, RUN, EXPOSE, CMD)
- Waiting for the image to build (it took 2-3 minutes)

### What Was Easy
- Following the YouTube tutorial
- Using docker build and docker run commands
- Testing the application in the browser

### Key Takeaways
- Docker packages applications with their dependencies
- An image is like a blueprint
- A container is a running instance of an image
- Port mapping connects the container port to the host

### Confidence Level
7/10 - I understand the basics but need more practice with Dockerfiles

### Energy Level
High - I'm excited about what I learned today!

---

## Day 2 - Thursday, April 16, 2026

### What I Learned Today
1. What docker-compose is and why it's useful
2. How to write a docker-compose.yml file
3. How to define multiple services in one file
4. How volumes work (data persistence)
5. How networks allow service communication
6. How depends_on manages startup order

### What Was Difficult
- Understanding YAML syntax (spaces matter!)
- Remembering all the docker-compose.yml keys
- Understanding how services communicate through networks
- Getting Redis to work correctly (had to check logs)

### What Was Easy
- Building the Node.js app (similar to yesterday)
- Using docker-compose up and docker-compose ps
- Reading docker-compose logs to debug issues

### Key Takeaways
- docker-compose dramatically simplifies managing multiple containers
- Volumes = persistent data storage
- Networks = service-to-service communication
- depends_on = manages startup order
- Official images (redis:7-alpine) save time vs writing Dockerfiles

### Confidence Level
8/10 - Better than yesterday! docker-compose makes sense now

### Energy Level
Good - Less tired than yesterday, exercise helped!

### Comparison Day 1 vs Day 2
- Day 1: Single container, simple app
- Day 2: Multiple containers, one depends on the other, data persistence
- Progress: 📈 Moving from basics to practical multi-app scenarios

### Next Day Goals
- Learn Docker networking concepts deeper
- Understand health checks in docker-compose
- Create a 3-container application
- Explore docker-compose override files
