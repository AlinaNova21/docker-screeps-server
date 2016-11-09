# Screeps Server

## Usage

	run `screeps init` in an empty directory
	then

    docker run -d --name screeps-server -v $PWD:/screeps -p 21025:21025 ags131/screeps-server 

## Launching a specific module

    docker run -d --name screeps-server -v $PWD:/screeps ags131/screeps-server screeps-backend

