# Docker Security Best Practices

## What I Implemented in Day 4

### 1. Non-Root User
- Created user 'nodejs' with UID 1001
- Container runs as non-root (safer)
- Even if app is compromised, attacker has limited privileges

### 2. Read-Only Filesystem
- Set read_only: true in docker-compose
- Container filesystem cannot be modified
- Prevents malware from writing files

### 3. Minimal Base Image
- Using node:18-alpine (not node:18)
- Alpine is ~150MB vs node:18 (~900MB)
- Fewer packages = smaller attack surface

### 4. Multi-Stage Build
- Stage 1: Install dependencies (builder)
- Stage 2: Copy only production code
- Removes build tools from final image
- Smaller image size = faster deployment

### 5. .dockerignore
- Excludes unnecessary files from Docker context
- Reduces build time
- Prevents secrets from being included

### 6. Health Checks
- Monitors container health
- Automatic restart if unhealthy
- Ensures uptime

### 7. Capability Dropping
- cap_drop: ALL
- cap_add: NET_BIND_SERVICE (only needed capability)
- Limits what container can do

## Docker Security Checklist

- [ ] Run as non-root user
- [ ] Use minimal base images (alpine)
- [ ] Use multi-stage builds
- [ ] Drop unnecessary capabilities
- [ ] Enable read-only filesystems
- [ ] Scan images for vulnerabilities
- [ ] Use secrets management (not env vars)
- [ ] Regular image updates
- [ ] Implement health checks
- [ ] Use .dockerignore

## Key Security Concepts

### 1. Principle of Least Privilege
- Give container only necessary permissions
- Run as non-root user
- Drop unnecessary Linux capabilities
- Use read-only filesystem when possible

### 2. Image Security
- Minimal base images (alpine, distroless)
- Remove build tools from final image
- Scan for vulnerabilities
- Keep base images updated

### 3. Container Security
- Use secrets, not environment variables
- Limit resource usage (CPU, memory)
- Use security scanning tools
- Monitor container behavior

### 4. Network Security
- Use custom networks (not default bridge)
- Restrict port exposure
- Use network policies
- Enable container network isolation

## Lessons Learned
1. Multi-stage builds = smaller, more secure images
2. Non-root user = better security posture
3. Minimal images = smaller attack surface
4. Read-only filesystem = prevents file modifications
5. Health checks = automatic recovery
