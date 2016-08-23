#!/usr/bin/env bash

project_dir=$(pwd)

# Terraform
if [ ! -f vendor/terraform/terraform ]; then
    bash $project_dir/scripts/dependencies/terraform.sh
fi