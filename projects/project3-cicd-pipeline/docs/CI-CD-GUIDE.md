# CI/CD Guide

## ¿Qué es CI/CD?

**CI (Continuous Integration)**: Integración continua del código
- Los devs hacen push frecuentemente
- Se ejecutan tests automáticamente
- Se detectan errores temprano

**CD (Continuous Deployment/Delivery)**: Despliegue continuo
- Cambios se despliegan automáticamente
- O se preparan para deployment manual
- Reduce tiempo a producción

## ¿Por qué CI/CD importa?

### Sin CI/CD (Manual)
Code → Manual tests → Manual build → Manual deploy
(slow, error-prone, inconsistent)

### Con CI/CD (Automático)
Code → Automatic tests → Automatic build → Automatic deploy
(fast, reliable, consistent)

## Nuestro Pipeline

Este proyecto implementa un **CI/CD pipeline completo** con 5 workflows:

### 1. Lint & Validate (10s)
**¿Qué hace?** Verifica que el código se vea bien
- Black formatter: Formatea el código
- Flake8: Detecta errores de estilo
- Pylint: Análisis avanzado

**Cuándo se ejecuta**: En cada push

**Ejemplo de error detectado**:
```python
# ❌ Malo
x=5+3  # Sin espacios

# ✅ Bueno (Black lo arregla)
x = 5 + 3
```

---

### 2. Tests (16s)
**¿Qué hace?** Verifica que el código funciona correctamente
- Unit tests: Prueban funciones individuales
- Integration tests: Prueban cómo funcionan juntas
- Coverage: Mide qué % del código está cubierto

**Cuándo se ejecuta**: Después del Lint

**Ejemplo**:
```python
# Test
def test_add():
    assert add(5, 3) == 8  # ✅ Funciona?

def test_integration():
    result = add(5, 3)
    result = subtract(result, 2)
    assert result == 6  # ✅ Todo junto?
```

---

### 3. Docker Publish (33s)
**¿Qué hace?** Crea una imagen Docker y la sube al registry
- Build imagen (multi-stage optimizado)
- Push a GitHub Container Registry
- Auto tagging (branch, SHA, semver)

**Cuándo se ejecuta**: Después de Tests

**Resultado**: Imagen disponible en GHCR
`Bash
docker pull ghcr.io/ferdev49/devops-lab/project3:main
`

---

### 4. Deploy to Staging (automático)
**¿Qué hace?** Despliega automáticamente a staging
- Descarga la imagen Docker
- Ejecuta docker-compose
- Verifica health checks

**Cuándo se ejecuta**: Después de Docker Publish

**Ambiente**: Staging (pre-producción)

---

### 5. E2E Tests (nuevo)
**¿Qué hace?** Prueba el flujo completo end-to-end
- Workflow completo
- Casos de borde
- Verificación de producción

**Cuándo se ejecuta**: En paralelo con otros

---

## 📊 Pipeline Completo (Flujo Visual)

```text
Code Push
    ↓
┌─────────────────────┐
│ 1. Lint & Validate  │ (10s)
│ ✅ Code quality OK  │
└────────┬────────────┘
         ↓
┌─────────────────────┐
│ 2. Tests            │ (16s)
│ ✅ 13+ tests pass   │
└────────┬────────────┘
         ↓
┌─────────────────────┐
│ 3. Docker Publish   │ (33s)
│ ✅ Image built      │
│ ✅ Pushed to GHCR   │
└────────┬────────────┘
         ↓
┌─────────────────────┐
│ 4. Deploy Staging   │ (auto)
│ ✅ App running      │
└────────┬────────────┘
         ↓
┌─────────────────────┐
│ 5. E2E Tests        │ (new)
│ ✅ Production ready │
└────────┬────────────┘
         ↓
✅ READY FOR PRODUCTION
```

---

## 🔑 Conceptos Clave

### Workflow (GitHub Actions)
Archivo YAML que define todo el pipeline.
Ubicación: `.github/workflows/`

### Trigger
Evento que inicia el workflow:
- `push` — cuando haces git push
- `pull_request` — cuando abres un PR
- `workflow_dispatch` — manual
- `workflow_run` — otro workflow completó

### Job
Conjunto de steps que corren en una máquina.

### Step
Acción individual:
```yaml
- name: Run tests
  run: pytest tests/ -v
```

### Action
Componente reutilizable:
```yaml
- uses: actions/checkout@v3
```

---

## 🚀 Cómo Usar Este Pipeline

### Para Desarrolladores

1. **Haces cambios al código**
   ```text Bash
   git commit -m "Add new feature"
   ```

2. **Haces push**
   ```text Bash
   git push origin main
   ```

3. **GitHub Actions automáticamente**:
   - Verifica el código
   - Ejecuta tests
   - Construye imagen Docker
   - Despliega a staging

4. **Tu trabajo**: Verificar que todo pasó
   - Ve a GitHub → Actions
   - Revisa que todos los workflows pasaron ✅

### Para DevOps

1. **Monitorear pipeline**
   - Tiempo de ejecución
   - Tasa de éxito
   - Cuellos de botella

2. **Mantener workflows**
   - Actualizar herramientas
   - Mejorar performance
   - Agregar nuevas etapas

3. **Escalar pipeline**
   - Agregar más tests
   - Integrar más servicios
   - Optimizar tiempos

---

## 📈 Métricas del Pipeline

| Stage | Tiempo | Status |
|-------|--------|--------|
| Lint | 10s | ✅ |
| Tests | 16s | ✅ |
| Docker | 33s | ✅ |
| Deploy | ~5s | ✅ |
| E2E | ~5s | ✅ |
| **Total** | **~69s** | **✅** |

---

## ⚡ Ventajas de Este Pipeline

✅ **Automatización** - No requiere intervención manual  
✅ **Velocidad** - Completo en ~69 segundos  
✅ **Confiabilidad** - Tests previenen bugs  
✅ **Consistencia** - Mismo proceso siempre  
✅ **Trazabilidad** - Auditoría de cambios  
✅ **Escalabilidad** - Fácil agregar etapas  

---

## 🔗 Próximos Pasos

1. **Monitoreo**: Agregar alertas
2. **Production**: Deploy a producción
3. **Secrets**: Gestión de credenciales
4. **Performance**: Testing de performance
5. **Security**: Análisis de seguridad

---

## 📚 Referencias

- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [CI/CD Best Practices](https://martinfowler.com/articles/continuousIntegration.html)
- [Docker Documentation](https://docs.docker.com/)
