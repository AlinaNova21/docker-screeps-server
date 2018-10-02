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

case $1 in
	init)
		init_srv
		;;
	run)
		run_srv
		;;
	*)
		exec "$@"
		;;
esac
