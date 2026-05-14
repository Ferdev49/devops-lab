#!/bin/bash

# Deployment script for staging environment

set -e

echo "=========================================="
echo "Deploying Project 3 to Staging"
echo "=========================================="

# Variables
DOCKER_IMAGE="\"
ENVIRONMENT="staging"
COMPOSE_FILE="docker-compose.yml"

if [ -z "\" ]; then
    echo "ERROR: Docker image not provided"
    echo "Usage: ./deploy.sh <docker-image>"
    exit 1
fi

echo "📦 Deploying image: \"

# Update docker-compose with new image
sed -i "s|image:.*|image: \|g" \

# Pull latest image
echo "📥 Pulling Docker image..."
docker pull \

# Stop and remove old containers
echo "🛑 Stopping old containers..."
docker-compose down || true

# Start new containers
echo "🚀 Starting new containers..."
docker-compose up -d

# Wait for health check
echo "⏳ Waiting for application to be healthy..."
sleep 5

# Verify deployment
echo "✅ Verifying deployment..."
if docker-compose ps | grep -q "healthy\|Up"; then
    echo "✅ Deployment successful!"
    docker-compose ps
    exit 0
else
    echo "❌ Deployment failed!"
    docker-compose logs
    exit 1
fi
