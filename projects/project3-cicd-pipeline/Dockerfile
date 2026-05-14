# Stage 1: Build
FROM python:3.11-slim as builder

WORKDIR /app

# Copiar requirements
COPY requirements.txt .

# Instalar dependencias en un directorio virtual
RUN pip install --user --no-cache-dir -r requirements.txt

---

# Stage 2: Runtime
FROM python:3.11-slim

WORKDIR /app

# Copiar solo lo necesario desde builder
COPY --from=builder /root/.local /root/.local
COPY app.py .

# Agregar .local/bin al PATH
ENV PATH=/root/.local/bin:\

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD python -c "from app import hello_world; hello_world()" || exit 1

# Comando por defecto
CMD ["python", "-u", "app.py"]
