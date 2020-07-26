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
	if [-z $SERVER_PASSWORD ]; then
		exec npx screeps start
	else
		exec npx screeps start --password $SERVER_PASSWORD
	fi;
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
