# Docker Guide

## Overview

Docker permite empaquetar la aplicación en un contenedor con todas sus dependencias.

## Dockerfile

- **Stage 1 (Builder)**: Instala dependencias Python
- **Stage 2 (Runtime)**: Copia solo lo necesario para ejecutar

### Beneficios
- ✅ Imagen más pequeña (multi-stage build)
- ✅ Seguridad (menos herramientas innecesarias)
- ✅ Portabilidad (mismo comportamiento en cualquier lugar)

## Build Local

```bash
# Build imagen
docker build -t project3-cicd:latest .

# Ejecutar contenedor
docker run -it project3-cicd:latest

# Con etiqueta
docker build -t ghcr.io/ferdev49/devops-lab/project3:v1.0.0 .
```

## Registry (GitHub Container Registry)

### Login
```bash
export CR_PAT=<tu_github_token>
echo $CR_PAT | docker login ghcr.io -u <username> --password-stdin
```

### Push
```bash
docker push ghcr.io/ferdev49/devops-lab/project3:v1.0.0
```

## CI/CD Integration

GitHub Actions automáticamente:
1. Build imagen
2. Push a GHCR
3. Etiqueta con rama y SHA
4. Cachea capas para builds más rápidos

## Salud del Contenedor

El HEALTHCHECK verifica que la app sigue funcionando:

```dockerfile
HEALTHCHECK --interval=30s --timeout=3s \
  CMD python -c "from app import hello_world; hello_world()" || exit 1
```

## Monitorear Imágenes

```bash
# Listar imágenes
docker images

# Ver detalles de imagen
docker inspect <image_id>

# Remover imagen
docker rmi <image_id>
```
