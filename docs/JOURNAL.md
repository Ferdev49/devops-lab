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

## Week 2 - Day 8 - Wednesday, April 22, 2026

### What I Learned Today
1. What Terraform is (Infrastructure as Code)
2. State file management and importance
3. Terraform workflow (init → plan → apply)
4. HCL (HashiCorp Configuration Language)
5. Providers, resources, variables, outputs
6. Security considerations for state files

### Transition from Docker to Terraform
- Docker: Containerizes applications
- Terraform: Manages cloud infrastructure
- Both: Infrastructure automation
- Both: Version control friendly

### Key Takeaway
Terraform's state file is the foundation of infrastructure management. It's crucial to understand how to manage, secure, and collaborate on state.

### Confidence Level
6/10 - New technology, foundational concepts make sense

### Next Steps
- Learn AWS provider (Day 9)
- Understand state locking and remote state
- Work with modules
- Master Terraform for production use

## Week 2 Complete - Terraform Mastery

### Three Days, Three Concepts

Day 8: Understood that state is critical
Day 9: Learned modules make code reusable
Day 10: Realized remote state enables teams

### Transformation
- Day 1 (Week 2): No Terraform knowledge
- Day 3 (Week 2): Production-ready understanding

### Statistics
- 3 days of Terraform
- 3 projects built
- 3 key concepts mastered
- 90% confidence level

### Ready For
- AWS infrastructure deployment
- Kubernetes with Terraform
- Team-based IaC workflows
- Production environments

## Week 3: Kubernetes Complete (Days 11-12)

### Day 11: Fundamentals
- Pods, Deployments, Services
- ConfigMaps, Namespaces
- Basic kubectl commands

### Day 12: Advanced
- StatefulSets for databases
- Persistent storage with PV/PVC
- Ingress for routing
- Secrets for sensitive data

### Week 3 Stats
- 2 days
- 2 projects
- 12 YAML manifests
- 25+ commits

### Ready for Week 4
- AWS integration
- Solutions Architect exam prep
