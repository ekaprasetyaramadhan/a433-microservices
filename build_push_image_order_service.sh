#!/usr/bin/env bash
set -euo pipefail

DOCKER_USERNAME="ekaramadhan35"

: "${DOCKER_PASSWORD:?Environment variable DOCKER_PASSWORD must be set}"

IMAGE_NAME="${DOCKER_USERNAME}/order-service:latest"

echo "==> Logging into Docker Hub (non-interactive)"
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

echo "==> Building backend image: $IMAGE_NAME"
docker build -t "$IMAGE_NAME" .

echo "==> Pushing backend image to Docker Hub"
docker push "$IMAGE_NAME"

echo "✅ Backend image pushed: $IMAGE_NAME"
