#!/usr/bin/env bash

project_dir=$(pwd)

access_key=${AWS_ACCESS_KEY_ID:-none}
secret_key=${AWS_SECRET_ACCESS_KEY:-none}

environment=${ENVIRONMENT:-r2d2}

if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/terraform.sh
fi

./vendor/terraform/terraform get -update=true terraform
./vendor/terraform/terraform apply -var environment=$environment -var access_key=$access_key -var secret_key=$secret_key -state $environment.tfstate terraform