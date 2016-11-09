#!/bin/bash
pid=0
term_handler() {
  echo "Caught SIGTERM signal!" 
  pkill -9 node 2>/dev/null
  exit 143; # 128 + 15 -- SIGTERM
}

trap term_handler SIGTERM

[[ "$AUTOUPDATE" == "1" ]] && npm update screeps

[[ "$2" == "start" ]] && [ ! -f /screeps/.screepsrc ] && echo "No .screepsrc found, please run 'screeps init' in your data directory" && exit 1

/app/node_modules/.bin/$@