# Screeps Server

## Usage
    
First init your server directory:

```docker run --rm -it -v $PWD:/screeps -e "SERVER_INIT=1" ags131/screeps-server```

Then start the Server:

```docker run -d --name screeps-server -v $PWD:/screeps -p 21025:21025 ags131/screeps-server```


## Launching a specific module

```docker run -d --name screeps-server -v $PWD:/screeps ags131/screeps-server screeps-backend```

