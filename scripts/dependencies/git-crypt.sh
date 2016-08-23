#!/usr/bin/env bash

version="0.5.0"
dist="vendor/git-crypt"

mkdir -p $dist
cd $dist

filename="git-crypt-${version}"
wget "https://www.agwa.name/projects/git-crypt/downloads/${filename}.tar.gz"
tar -zxf "${filename}.tar.gz"
cd $filename

make
make install