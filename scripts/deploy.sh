#!/usr/bin/env bash

sha=$(git rev-parse --short HEAD)

access_key=${AWS_ACCESS_KEY_ID:-none}
secret_key=${AWS_SECRET_ACCESS_KEY:-none}
region=${AWS_REGION:-none}
environment=${ENVIRONMENT:-r2d2}

touch .credentials
echo "[default]" >> .credentials
echo "aws_access_key_id=${access_key}" >> .credentials
echo "aws_secret_access_key=${secret_key}" >> .credentials

mkdir -p ~/.aws
mv .credentials ~/.aws/credentials

sudo pip install awsebcli

eb init -r $region -p Docker sam-hubot-$environment
eb create $environment-default