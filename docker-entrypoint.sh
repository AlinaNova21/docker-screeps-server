#!/bin/bash
set -e

function init_srv(){
	echo "===== SETTING UP SCREEPS ====="
        yarn init -y
        yarn add screeps
        npx screeps init
}

function run_srv(){
	cd /screeps
	exec npx screeps start
}

if [ "$1" = "init" ]; then
	init_srv
	run_srv
fi

if [ "$1" = "run" ]; then
	run_srv
fi

exec "$@"
