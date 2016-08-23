#!/usr/bin/env bash

version='0.7.0-rc3'
os=${SYSTEM:-linux}

dist="vendor/terraform"
filename="terraform_${version}_${os}_amd64.zip"

mkdir -p $dist
cd $dist
wget "https://releases.hashicorp.com/terraform/${version}/${filename}"
unzip $filename