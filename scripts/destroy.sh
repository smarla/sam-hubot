#!/usr/bin/env bash

project_dir=$(pwd)

# Sourcing vars
source $project_dir/scripts/.deployment-profile


if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/terraform.sh
fi

./vendor/terraform/terraform remote config \
    -backend=s3 \
    -backend-config="bucket=${STATES_BUCKET}" \
    -backend-config="key=${STATES_KEY}" \
    -backend-config="access_key=${AWS_ACCESS_KEY_ID_S3}" \
    -backend-config="secret_key=${AWS_SECRET_ACCESS_KEY_S3}" \
    -backend-config="region=${AWS_REGION}"

./vendor/terraform/terraform get -update=true infra
./vendor/terraform/terraform destroy \
    -var "environment=${ENVIRONMENT}" \
    -var "aws_access_key=${AWS_ACCESS_KEY_ID}" \
    -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}" \
    -var "aws_region=${AWS_REGION}" \
    -var "hubot_slack_token=${HUBOT_SLACK_TOKEN}" \
    -var "hubot_google_cse_id=${HUBOT_GOOGLE_CSE_ID}" \
    -var "hubot_google_cse_key=${HUBOT_GOOGLE_CSE_KEY}" \
    infra