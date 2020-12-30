#!/bin/bash
set -e

function init_srv(){
	echo "===== SETTING UP SCREEPS ====="
	yarn init -y
	yarn add screeps
	if [ -n "$STEAM_API_KEY" ]; then
	  echo "$STEAM_API_KEY" | npx screeps init >/dev/null
	else
		npx screeps init
	fi
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
