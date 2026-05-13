# Project 3: CI/CD Pipeline with GitHub Actions

## Overview
Automatización de build, testing y deployment usando GitHub Actions.

## Estructura del Proyecto

```text
project3-cicd-pipeline/
├── .github/workflows/
│   ├── lint.yml          # Code quality checks ✅
│   ├── test.yml          # Testing workflow ⏳
│   ├── docker-publish.yml # Docker build & push (próximo)
│   └── deploy.yml        # Deployment (próximo)
├── tests/
│   ├── unit/
│   │   └── test_app.py
│   ├── integration/
│   │   └── test_workflow.py
│   └── e2e/
├── docs/
│   ├── CI-CD-GUIDE.md
│   ├── TESTING-GUIDE.md
│   └── voice-memos/
├── src/
├── app.py                # Main application
├── requirements.txt      # Python dependencies
├── .gitignore
├── Makefile
└── README.md
```

## Objetivos

- [x] Lint & Code Quality (lint.yml) ✅
- [ ] Unit Testing (test.yml)
- [ ] Integration Testing
- [ ] Docker Build & Push
- [ ] Deployment Automation

## Workflows Implementados

### lint.yml ✅
Valida la calidad del código usando Black, Flake8, Pylint.
Status: ✅ Success

### test.yml (HOY)
Ejecuta tests unitarios e integración con pytest.
- Unit tests: 	ests/unit/test_app.py
- Integration tests: 	ests/integration/test_workflow.py
- Coverage reporting

## Cómo ejecutar localmente

\\\ash
# Install dependencies
pip install -r requirements.txt

# Run linting
black . --check
flake8 .

# Run tests
pytest tests/ -v

# Run tests with coverage
pytest tests/ -v --cov=.
\\\

## Progress

- [x] Day 31: Lint workflow setup ✅
- [ ] Day 32: Testing workflow (HOY)
- [ ] Day 33: Docker publish workflow
- [ ] Day 34: Deployment workflow
- [ ] Day 35: E2E testing & refinement
