# Deployment Guide

## Environments

### Staging
- **Purpose**: Pre-production testing environment
- **Auto-deploy**: After Docker Publish workflow succeeds
- **Frequency**: Every push to main
- **Data**: Test data (safe to reset)
- **Access**: Internal team only

### Production
- **Purpose**: Live environment for users
- **Deploy**: Manual trigger or scheduled
- **Frequency**: On-demand
- **Data**: Real user data (careful!)
- **Access**: Public

## Deployment Pipeline

```text
Code Push
    ↓
Lint & Tests ✅
    ↓
Docker Build & Push ✅
    ↓
Deploy to Staging (automatic) ← Day 34
    ↓
Manual approval
    ↓
Deploy to Production (manual)
```

## Manual Deployment to Staging

### Using deploy.sh

```text Bash
cd deployment/staging
./deploy.sh ghcr.io/ferdev49/devops-lab/project3:main
```

### Using docker-compose directly

```text Bash
cd deployment/staging
docker-compose up -d
docker-compose logs -f
docker-compose ps
```

## Health Checks

The application includes health checks:

```text Bash
# Check manually
docker-compose exec app python -c "from app import hello_world; hello_world()"

# View health status
docker-compose ps
```

## Rollback Strategy

If deployment fails:

```text Bash
# Stop current deployment
docker-compose down

# Go back to previous image
git checkout HEAD~1 deployment/staging/docker-compose.yml

# Redeploy with previous version
docker-compose up -d
```

## Monitoring

### Logs
```text Bash
# View application logs
docker-compose logs app

# Follow logs in real-time
docker-compose logs -f app
```

### Metrics
- Container uptime
- Health check status
- Resource usage (CPU, memory)

## Best Practices

1. ✅ Always test in staging first
2. ✅ Verify health checks pass
3. ✅ Keep staging close to production
4. ✅ Document all deployment steps
5. ✅ Have rollback plan ready
6. ✅ Monitor after deployment
