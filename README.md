# Screeps Server

## NOTE
I moved the repo to quay.io for automated updates, the dockerhub version is now deprecated!

## Setup
  
### Init
1. If you have an existing server directory, cd into it and skip to first start
2. Create an empty folder and enter it
3. Init your server directory: 
  ```docker run --rm -it -v $PWD:/screeps quay.io/ags131/screeps-server screeps init```

### First start
1. Make sure you are in the server directory
2. Start the Server:  
```docker run -d --name screeps-server -v $PWD:/screeps -p 21025:21025 quay.io/ags131/screeps-server```
3. Done! Your server should now be accessible.

### Mods
Mods can be installed by running:
```docker run --rm -v $PWD:/screeps quay.io/ags131/screeps-server yarn add screepsmod-auth```

### CLI
The CLI can be accessed by running:
```docker exec -it screeps-server screeps cli```

## Stopping and starting the server
Stop:
```docker stop screeps-server```  
Start:
```docker start screeps-server```

## Updating

1. Stop the server:
  ```docker stop screeps-server```
2. Remove the server:
  ```docker rm screeps-server```
3. Follow instructions from First Start above

## Launching a specific module
For more advanced usage and more control over scaling, you can launch individual modules. Note that each module may have different environment variables needed to run.
```docker run -d --name screeps-server-backend -v $PWD:/screeps quay.io/ags131/screeps-server screeps-backend```

