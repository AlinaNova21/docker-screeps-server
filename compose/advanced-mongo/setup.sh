#!/bin/bash
docker run --rm -it -v $PWD/server:/screeps quay.io/ags131/screeps-server screeps init
docker run --rm -v $PWD/server:/screeps quay.io/ags131/screeps-server npm install screepsmod-mongo