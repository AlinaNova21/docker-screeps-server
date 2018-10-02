# Screeps Server

There are two different type how to start a screeps server.
* [without a world](#create-the-world)
* [with a world already created](#running-the-server)

## Create the world
If you do not have an existing server directory, just start the Docker container with the command line argument `init`, and everything gets done for you.

```bash
docker run -it --rm -v $PWD:/screeps quay.io/ags131/screeps-server init
```
Now it's all set to run the Screeps server.

## Running the server
If you have already a server directory (from previous installations) follow the steps below.

1. Make sure you are in the server directory
2. Run the server
```bash
docker run -d --name screeps-server -v $PWD:/screeps -p 21025:21025 quay.io/ags131/screeps-server
```

## Managing the server


### Mods
Mods can be installed by running:
```docker run --rm -v $PWD:/screeps quay.io/ags131/screeps-server yarn add screepsmod-auth```

### CLI
The CLI can be accessed by running:
```docker exec -it screeps-server npx screeps cli```

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
3. Follow [Running the server](#running-the-server)

## Launching a specific module
For more advanced usage and more control over scaling, you can launch individual modules. Note that each module may have different environment variables needed to run.
```docker run -d --name screeps-server-backend -v $PWD:/screeps quay.io/ags131/screeps-server@beta screeps-backend```

