#!/bin/bash
pid=0
term_handler() {
  echo "Caught SIGTERM signal!" 
  pkill -9 node 2>/dev/null
  exit 143; # 128 + 15 -- SIGTERM
}


export AUTOUPDATE=${AUTOUPDATE:-1}
export DB_PATH=${DB_PATH:-/screeps/db.json}
export ASSET_DIR=${ASSET_DIR:-/screeps/assets}
export MOD_DIR=${MOD_DIR:-/screeps/mods}
export GAME_PORT=${GAME_PORT:-21025}
export GAME_HOST=${GAME_HOST:-0.0.0.0}
export CLI_PORT=${CLI_PORT:-21026}
export CLI_HOST=${CLI_HOST:-0.0.0.0}
export STORAGE_PORT=${STORAGE_PORT:-21027}
export STORAGE_HOST=${STORAGE_HOST:-localhost}

trap term_handler SIGTERM

[[ "$AUTOUPDATE" == "1" ]] && npm update screeps

[[ "$2" == "start" ]] && [ ! -f /screeps/.screepsrc ] && echo "No .screepsrc found, please run 'screeps init' in your data directory" && exit 1
echo Launching $@
#env
/app/node_modules/.bin/$@
