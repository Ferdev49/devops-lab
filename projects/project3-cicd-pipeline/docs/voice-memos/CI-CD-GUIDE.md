# CI/CD Pipeline Guide

## ¿Qué es CI/CD?

**CI (Continuous Integration)**
- Integra código frecuentemente
- Ejecuta tests automáticamente
- Detecta errores temprano

**CD (Continuous Deployment/Delivery)**
- Despliega cambios automáticamente
- O prepara para deployment manual
- Reduce tiempo a producción

## GitHub Actions Concepts

### Workflow
Archivo YAML que define el pipeline completo.

### Trigger
Evento que inicia el workflow:
- `push` — Cuando haces push
- `pull_request` — Cuando abres un PR
- `schedule` — En tiempo programado
- `workflow_dispatch` — Manual

### Job
Conjunto de steps que corren en una máquina.

### Step
Acción individual dentro de un job:
```yaml
- name: Run tests
  run: pytest
```

### Action
Bloque reutilizable:
```yaml
- uses: actions/checkout@v3
```

## Nuestro Pipeline
Código → Push → GitHub Actions → Lint → Tests → Docker → Deploy
↓
Si falla → Notificar

## Próximos Steps

1. Day 32: Testing workflow
2. Day 33: Docker publish
3. Day 34: Deployment
4. Day 35: Refinement