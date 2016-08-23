#!/usr/bin/env bash

project_dir=$(pwd)
sha=$(git rev-parse --short HEAD)

# Sourcing vars
source $project_dir/scripts/.deployment-profile

touch .credentials
echo "[default]" >> .credentials
echo "aws_access_key_id=${AWS_ACCESS_KEY_ID}" >> .credentials
echo "aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}" >> .credentials

mkdir -p ~/.aws
mv .credentials ~/.aws/credentials

sudo pip install awsebcli

eb init -r $AWS_REGION -p Docker "sam-hubot-${ENVIRONMENT}"
eb create "${ENVIRONMENT}-default"