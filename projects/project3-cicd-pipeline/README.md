# Project 3: CI/CD Pipeline with GitHub Actions

## Overview
Automatización de build, testing, deployment usando GitHub Actions.

## Estructura del Proyecto

```text
project3-cicd-pipeline/
├── .github/workflows/
│   ├── lint.yml              # Code quality checks ✅
│   ├── test.yml              # Testing workflow ✅
│   ├── docker-publish.yml    # Docker build & push ✅
│   └── deploy-staging.yml    # Deploy to staging ⏳
├── deployment/
│   ├── staging/
│   │   ├── docker-compose.yml
│   │   └── deploy.sh
│   └── production/           # Próximo
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── docs/
│   ├── CI-CD-GUIDE.md
│   ├── TESTING-GUIDE.md
│   ├── DOCKER-GUIDE.md
│   ├── DEPLOYMENT-GUIDE.md
│   └── voice-memos/
├── app.py
├── Dockerfile
├── requirements.txt
├── .env.example
└── README.md
```

## Objetivos

- [x] Lint & Code Quality (lint.yml) ✅
- [x] Unit Testing (test.yml) ✅
- [x] Docker Build & Push (docker-publish.yml) ✅
- [ ] Deploy to Staging (deploy-staging.yml)
- [ ] E2E Testing & Production Ready

## Workflows Implementados

### lint.yml ✅
Valida calidad del código.
**Status: ✅ Success (13s)**

### test.yml ✅
Ejecuta tests (10/10 passing).
**Status: ✅ Success (16s)**

### docker-publish.yml ✅
Build y push de imagen Docker.
**Status: ✅ Success (33s)**

### deploy-staging.yml (HOY)
Deploy automático a staging después de Docker Publish.
- Triggered by Docker Publish workflow
- Automatic deployment to staging
- Health check verification
- Notification support

## CI/CD Pipeline Completo

```text
Push to main
    ↓
Lint & Validate (13s) ✅
    ↓
Tests (16s) ✅
    ↓
Docker Build & Push (33s) ✅
    ↓
Deploy to Staging (automatic) ⏳
    ↓
Manual approval
    ↓
Deploy to Production (próximo)
```

## Cómo ejecutar localmente

### Deploy a Staging
```text Bash
cd deployment/staging
docker-compose up -d
docker-compose logs -f
```

### Verificar Health
```text Bash
docker-compose ps
docker-compose exec app python -c "from app import hello_world; hello_world()"
```

## Progress

- [x] Day 31: Lint workflow setup ✅
- [x] Day 32: Testing workflow ✅
- [x] Day 33: Docker publish workflow ✅
- [ ] Day 34: Deploy to staging (HOY)
- [ ] Day 35: E2E testing & production ready

## Recursos

- [Docker Compose](https://docs.docker.com/compose/)
- [GitHub Actions Workflows](https://docs.github.com/en/actions)
- [Deployment Strategies](https://martinfowler.com/bliki/BlueGreenDeployment.html)
