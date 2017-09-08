#!/bin/bash

if [[ -z "$1" ]]; then
  echo Please pass version to build
  exit 1
fi

VER=$1

docker build -t ags131/screeps-server:$VER -t ags131/screeps-server:latest . --build-arg SCREEPS_VERSION=$VER