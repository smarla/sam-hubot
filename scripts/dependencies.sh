#!/usr/bin/env bash

project_dir=$(pwd)

# Git crypt
if [ ! -d vendor/git-crypt ]; then
    bash $project_dir/scripts/dependencies/git-crypt.sh
fi

# GPG Keys & Repo unlocking
gpg --import $project_dir/deployments-gpg
git crypt unlock

# Terraform
if [ ! -d vendor/terraform ]; then
    bash $project_dir/scripts/dependencies/terraform.sh
fi