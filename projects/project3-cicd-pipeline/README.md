# Project 3: CI/CD Pipeline with GitHub Actions

## Overview
Automatización de build, testing y deployment usando GitHub Actions.

## Estructura del Proyecto

```text
project3-cicd-pipeline/
├── .github/workflows/
│   ├── lint.yml              # Code quality checks ✅
│   ├── test.yml              # Testing workflow ✅
│   ├── docker-publish.yml    # Docker build & push ⏳
│   └── deploy.yml            # Deployment (próximo)
├── tests/
│   ├── unit/
│   │   └── test_app.py
│   ├── integration/
│   │   └── test_workflow.py
│   └── e2e/
├── docs/
│   ├── CI-CD-GUIDE.md
│   ├── TESTING-GUIDE.md
│   ├── DOCKER-GUIDE.md
│   └── voice-memos/
├── app.py                    # Main application
├── Dockerfile                # Container image
├── .dockerignore
├── requirements.txt          # Python dependencies
├── .gitignore
└── README.md
```

## Objetivos

- [x] Lint & Code Quality (lint.yml) ✅
- [x] Unit Testing (test.yml) ✅
- [ ] Docker Build & Push (docker-publish.yml)
- [ ] Deployment Automation
- [ ] E2E Testing & Refinement

## Workflows Implementados

### lint.yml ✅
Valida la calidad del código usando Black, Flake8, Pylint.
**Status: ✅ Success (10s)**

### test.yml ✅
Ejecuta tests unitarios e integración con pytest.
**Status: ✅ Success (15s)** - 10/10 test cases passing

### docker-publish.yml (HOY)
Build y push de imagen Docker a GitHub Container Registry (GHCR).
- Multi-stage Dockerfile (optimizado)
- Health checks incluidos
- Automatic tagging (branch, SHA, semver)
- Layer caching para builds rápidos

## Cómo ejecutar localmente

### Linting
```text Bash
pip install -r requirements.txt
black . --check
flake8 .
```

### Testing
```text Bash
pytest tests/ -v
pytest tests/ -v --cov=.
```

### Docker
```text Bash
# Build
docker build -t project3-cicd:latest .

# Run
docker run -it project3-cicd:latest

# Push (si tienes acceso a registry)
docker push ghcr.io/ferdev49/devops-lab/project3:latest
```

## CI/CD Pipeline

```text
Push to main
    ↓
Lint & Validate (10s) ✅
    ↓
Tests (15s) ✅
    ↓
Docker Build & Push (30s) ⏳
    ↓
Deploy to staging (próximo)
```

## Progress

- [x] Day 31: Lint workflow setup ✅
- [x] Day 32: Testing workflow ✅
- [ ] Day 33: Docker publish workflow (HOY)
- [ ] Day 34: Deployment workflow
- [ ] Day 35: E2E testing & refinement

## Registry

**GitHub Container Registry**: ghcr.io/ferdev49/devops-lab/project3

### Ver imágenes
https://github.com/Ferdev49/devops-lab/pkgs/container/project3-cicd-pipeline

## Recursos

- [Docker Documentation](https://docs.docker.com/)
- [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
- [Multi-stage builds](https://docs.docker.com/build/building/multi-stage/)
