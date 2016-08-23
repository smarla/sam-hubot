#!/usr/bin/env bash

docker login -e $registry_email -u $registry_user -p $registry_pass
docker push smarla/sam-hubot:latest