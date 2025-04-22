#!/bin/bash

# 1. Membuat Docker image dengan nama item-app dan tag v1
echo "Membangun Docker image..."
docker build -t item-app:v1 .

# 2. Melihat daftar image yang ada di lokal
echo "Daftar Docker images di lokal:"
docker images

# 3. Mengubah nama image agar sesuai dengan format Docker Hub
# Gantilah USERNAME dengan username Docker Hub Anda
DOCKER_USERNAME="ekaramadhan35"
DOCKER_REPO="item-app"
DOCKER_TAG="v1"

echo "Menambahkan tag untuk Docker Hub..."
docker tag item-app:v1 $DOCKER_USERNAME/$DOCKER_REPO:$DOCKER_TAG

# 4. Login ke Docker Hub
echo "Login ke Docker Hub..."
docker login --username $DOCKER_USERNAME

# 5. Mengunggah image ke Docker Hub
echo "Mengunggah image ke Docker Hub..."
docker push $DOCKER_USERNAME/$DOCKER_REPO:$DOCKER_TAG

echo "Proses build dan push selesai."
