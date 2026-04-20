# Docker Secrets Management

## What are Secrets?

Secrets are sensitive data (passwords, API keys, tokens) managed by Docker Swarm.

### Why Not Environment Variables?

**Environment Variables (BAD for secrets):**
- Visible in \docker inspect\
- Visible in container processes
- Logged in container logs
- Passed to all containers

**Docker Secrets (GOOD for secrets):**
- Only visible to authorized services
- Not in container environment
- Securely stored on manager node
- Never logged or exposed

## Types of Sensitive Data

### 1. Secrets (Sensitive)
- Database passwords
- API keys
- OAuth tokens
- Private keys
- SSH credentials

### 2. Configs (Non-sensitive)
- Application settings
- Configuration files
- Feature flags
- Non-secret environment variables

## Docker Secrets in Swarm

### Create Secret
\\\ash
echo 'my-api-key-12345' | docker secret create api_key -

echo 'postgres://user:pass@db:5432' | docker secret create db_url -
\\\

### Use in Service
\\\ash
docker service create \\
  --name my-app \\
  --secret api_key \\
  --secret db_url \\
  my-app:latest
\\\

### Read in Container
\\\ash
# Secrets mounted at /run/secrets/
cat /run/secrets/api_key
cat /run/secrets/db_url
\\\

### Remove Secret
\\\ash
docker secret rm api_key db_url
\\\

## Secret Best Practices

### ✅ DO:
- Use Docker Secrets for passwords/tokens
- Use Docker Configs for non-sensitive settings
- Rotate secrets regularly
- Use least privilege (only needed services get secrets)
- Use proper secret storage (HashiCorp Vault, AWS Secrets Manager)
- Encrypt secrets in transit
- Audit secret access

### ❌ DON'T:
- Don't hardcode secrets in Dockerfile
- Don't use environment variables for passwords
- Don't store secrets in version control
- Don't log sensitive data
- Don't pass secrets as command arguments
- Don't commit .env files

## My Day 6 Implementation

### App reads secrets from /run/secrets/
- API key: /run/secrets/api_key
- Database URL: /run/secrets/db_url
- Shows status of loaded secrets
- Never logs actual values

### Security Features
- Non-root user (nodejs)
- Read-only filesystem option available
- Health checks enabled
- Proper secret handling

## Docker Secrets vs Kubernetes Secrets

| Feature | Docker Swarm | Kubernetes |
|---------|--------------|-----------|
| Encryption | In transit | At rest + in transit |
| Storage | On manager node | etcd database |
| Rotation | Manual | Via controllers |
| Access Control | Basic | Advanced RBAC |
| Complexity | Simple | Complex |

## Key Takeaways
1. Secrets != Environment Variables
2. Secrets are for sensitive data (passwords, keys)
3. Configs are for non-sensitive settings
4. Always read secrets from /run/secrets/
5. Never hardcode or log secrets
6. Production: use Vault or cloud provider
