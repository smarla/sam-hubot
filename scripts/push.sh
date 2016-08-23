#!/usr/bin/env bash

project_dir=$(pwd)

# Sourcing vars
source $project_dir/scripts/.deployment-profile

docker login -e $REGISTRY_EMAIL -u $REGISTRY_USER -p $REGISTRY_PASS
docker push smarla/sam-hubot:latest