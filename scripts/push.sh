#!/usr/bin/env bash

$registry_email=${REGISTRY_EMAIL:-none}
$registry_user=${REGISTRY_USER:-none}
$registry_pass=${REGISTRY_PASS:-none}

docker login -e $registry_email -u $registry_user -p $registry_pass
docker push smarla/sam-hubot:latest