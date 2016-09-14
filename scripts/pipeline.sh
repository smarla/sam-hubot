#!/usr/bin/env bash

project_dir=$(pwd)
script_dir="${project_dir}/scripts"

source $script_dir/.deployment_profile

bash scripts/dependencies.sh

bash scripts/build.sh
bash scripts/push.sh
bash scripts/provision.sh
bash scripts/deploy.sh