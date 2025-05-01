#!/usr/bin/env bash
set -euo pipefail

DOCKER_USERNAME="ekaramadhan35"
: "${DOCKER_PASSWORD:?Environment variable DOCKER_PASSWORD must be set}"

IMAGE_NAME="${DOCKER_USERNAME}/karsajobs-ui:latest"

echo "==> Logging into Docker Hub (non-interactive)"
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

echo "==> Building frontend image: $IMAGE_NAME"
docker build -t "$IMAGE_NAME" .

echo "==> Pushing frontend image to Docker Hub"
docker push "$IMAGE_NAME"

echo "✅ Frontend image pushed: $IMAGE_NAME"
