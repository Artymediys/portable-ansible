#!/bin/bash

# Variables
IMAGE_NAME=""
REGISTRY_URL=""
LOGIN=""
PASSWORD=""

# Function to check the exit status of the last executed command
check_success() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed."
        exit 1
    fi
}

# Log in to registry
echo $PASSWORD | docker login $REGISTRY_URL -u $LOGIN --password-stdin
check_success "Docker login"

# Building Docker image
docker build -t $IMAGE_NAME .
check_success "Docker build"

# Tagging image
docker tag $IMAGE_NAME $REGISTRY_URL/$IMAGE_NAME:latest
check_success "Docker tag"

# Pushing image to registry
docker push $REGISTRY_URL/$IMAGE_NAME:latest
check_success "Docker push"

# If all commands succeed
echo "Docker image pushed to $REGISTRY_URL/$IMAGE_NAME:latest successfully."
