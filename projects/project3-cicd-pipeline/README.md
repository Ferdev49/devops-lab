# Project 3: CI/CD Pipeline with GitHub Actions

## Overview
Automatización de build, testing y deployment usando GitHub Actions.

## Estructura del Proyecto
```text
project3-cicd-pipeline/
├── .github/workflows/
│   ├── lint.yml          # Code quality checks
│   ├── test.yml          # Unit & integration tests (próximo)
│   ├── docker-publish.yml # Docker build & push (próximo)
│   └── deploy.yml        # Deployment (próximo)
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── docs/
│   ├── CI-CD-GUIDE.md
│   └── voice-memos/
├── src/
├── app.py                # Main application
├── requirements.txt      # Python dependencies
├── .gitignore
├── Makefile
└── README.md
```

## Objetivos

- [x] Lint & Code Quality (lint.yml)
- [ ] Unit Testing (test.yml)
- [ ] Integration Testing
- [ ] Docker Build & Push
- [ ] Deployment Automation

## Workflows Implementados

### lint.yml
Valida la calidad del código usando:
- **Black**: Formateador de código
- **Flake8**: Linter de estilos
- **Pylint**: Análisis de código avanzado

Se dispara en:
- Push a cualquier rama
- Pull requests a main/develop

## Cómo ejecutar localmente

```bash
# Install dependencies
pip install -r requirements.txt

# Run linting
black . --check
flake8 .
pylint **/*.py
```

## Progress

- [x] Day 31: Lint workflow setup
- [ ] Day 32: Testing workflow
- [ ] Day 33: Docker publish workflow
- [ ] Day 34: Deployment workflow
- [ ] Day 35: E2E testing & refinement