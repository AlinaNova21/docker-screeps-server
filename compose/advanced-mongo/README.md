Edit `.env` to set your Steam Key. You can also configure other parameters there.

### First start
1. Init your server directory: 
  ```docker run --rm -it -v $PWD:/screeps quay.io/ags131/screeps-server screeps init server```
2. Install mods
  ```docker run --rm -v $PWD:/screeps quay.io/ags131/screeps-server yarn add screepsmod-mongo```
3. Start the Server:  
```docker-compose up```
4. Done! Your server should now be accessible.

### Mods
Additional mods can be installed by running:
```docker run --rm -v $PWD:/screeps quay.io/ags131/screeps-server yarn add screepsmod-auth```