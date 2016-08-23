#!/usr/bin/env bash

project_dir=$(pwd)

# GPG Keys & Repo unlocking
gpg --import /var/snap-ci/repo/deployments-gpg
git crypt unlock

# Terraform
if [ ! -f vendor/terraform/terraform ]; then
    bash $project_dir/scripts/dependencies/terraform.sh
fi