#!/usr/bin/env bash

project_dir=$(pwd)

# Git crypt
if [ ! -d vendor/git-crypt ]; then
    bash $project_dir/scripts/dependencies/git-crypt.sh
fi

# GPG Keys & Repo unlocking
gpg --import /var/snap-ci/repo/deployments-gpg
git crypt unlock

# Sourcing vars
source $project_dir/scripts/.deployment-profile

# Terraform
if [ ! -d vendor/terraform ]; then
    bash $project_dir/scripts/dependencies/terraform.sh
fi