#!/bin/bash

# Variables
IMAGE_NAME=""
REGISTRY_URL=""
LOGIN=""
PASSWORD=""

# Building Docker-image
docker build -t $IMAGE_NAME .

# Log in to registry
echo $PASSWORD | docker login $REGISTRY_URL -u $LOGIN --password-stdin

# Tagging image
docker tag $IMAGE_NAME $REGISTRY_URL/$IMAGE_NAME:latest

# Pushing image to registry
docker push $REGISTRY_URL/$IMAGE_NAME:latest

echo "Docker image pushed to $REGISTRY_URL/$IMAGE_NAME:latest"
