FROM ubuntu:16.04
RUN apt-get update;\
    apt-get install -y apt-utils;\
    apt-get dist-upgrade -y;\
    apt-get install -y curl unzip python build-essential git
RUN curl -SLO "https://github.com/laverdet/node/archive/tailcall-backport.zip"
RUN unzip "tailcall-backport.zip"
WORKDIR /node-tailcall-backport
RUN ./configure
RUN make -j 4
RUN make install 

FROM ubuntu:16.04

VOLUME /screeps
WORKDIR /screeps
ENV SCREEPS_VERSION 3.0.0-beta.5
ENV DB_PATH=/screeps/db.json ASSET_DIR=/screeps/assets \
	MODFILE=/screeps/mods.json GAME_PORT=21025 \
	GAME_HOST=0.0.0.0 CLI_PORT=21026 CLI_HOST=0.0.0.0 \
	STORAGE_PORT=21027 STORAGE_HOST=localhost \
	DRIVER_MODULE="@screeps/driver"
WORKDIR /screeps
COPY --from=0 /usr/local /usr/local
RUN yarn add screeps@$SCREEPS_VERSION
RUN yarn add github:laverdet/isolated-vm
ENTRYPOINT ["npx"]
CMD ["screeps","start"]
