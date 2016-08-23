#!/usr/bin/env bash

project_dir=$(pwd)
environment=${ENVIRONMENT:-r2d2}

access_key_deployment=${AWS_ACCESS_KEY_ID:-none}
secret_key_deployment=${AWS_SECRET_ACCESS_KEY:-none}
region_deployment=${AWS_REGION:-none}

access_key_states=${AWS_ACCESS_KEY_ID_S3:-none}
secret_key_states=${AWS_SECRET_ACCESS_KEY_S3:-none}
region_states=${AWS_REGION_S3:-none}
bucket_states=${STATES_BUCKET:-none}
state_key="/sam/sam-hubot/${environment}.tfstate"


if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/terraform.sh
fi

./vendor/terraform/terraform remote config \
    -backend=s3 \
    -backend-config="bucket=${bucket_states}" \
    -backend-config="key=${state_key}" \
    -backend-config="region=${region_states}"

./vendor/terraform/terraform get -update=true infra
./vendor/terraform/terraform destroy \
    -var environment=$environment \
    -var aws_access_key=$access_key_deployment \
    -var aws_secret_key=$secret_key_deployment \
    -var aws_region=$region_deployment \
    -var hubot_slack_token=$hubot_slack_token \
    infra