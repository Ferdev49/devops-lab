# Docker Image Optimization

## Why Optimize?

### Smaller Images = Better
- Faster downloads
- Faster container startup
- Less disk space
- Lower bandwidth costs
- Faster deployment

## Optimization Techniques

### 1. Multi-Stage Builds
**Before:** 950MB (includes build tools)
**After:** 180MB (only production code)

`dockerfile
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install

FROM node:18-alpine
COPY --from=builder /app/node_modules ./node_modules
COPY app.js .
CMD ["node", "app.js"]
`

### 2. Use Alpine Base Images
**node:18:** ~900MB
**node:18-alpine:** ~180MB

Alpine is minimal Linux distro (5MB base)

### 3. .dockerignore
Exclude unnecessary files:
- node_modules (will be rebuilt)
- .git
- README.md
- tests
- build artifacts

### 4. Layer Caching
`dockerfile
# BAD: Changes to code invalidate dependency layer
COPY . .
RUN npm install

# GOOD: Dependencies cached, only code updated
COPY package.json .
RUN npm install
COPY . .
`

### 5. Clean Up
`dockerfile
# Install + cleanup in one layer
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Not this:
RUN apt-get update
RUN apt-get install -y curl
RUN rm -rf /var/lib/apt/lists/*
`

## Image Analysis

### View layers
\\\ash
docker history day4-secure-app:latest
\\\

### View size
\\\ash
docker images | grep day4
\\\

### Scan for vulnerabilities
\\\ash
docker scan day4-secure-app:latest
\\\

## My Day 4 Optimizations

- [x] Multi-stage build (950MB → 180MB)
- [x] Alpine base image
- [x] .dockerignore file
- [x] Layer caching strategy
- [x] Non-root user (security + optimization)

## Lessons Learned
1. Multi-stage builds are game-changers
2. Alpine images save significant space
3. .dockerignore prevents unnecessary files
4. Layer ordering matters for caching
5. Security and optimization go hand-in-hand
