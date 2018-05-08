FROM ags131/node:8.11.1
ENV SCREEPS_VERSION 3.0.0-beta.11
WORKDIR /screeps
#RUN apk add --no-cache python make g++ git
RUN yarn add screeps@"$SCREEPS_VERSION"

FROM ags131/node:8.11.1
VOLUME /screeps
WORKDIR /screeps
ENV DB_PATH=/screeps/db.json ASSET_DIR=/screeps/assets \
	MODFILE=/screeps/mods.json GAME_PORT=21025 \
	GAME_HOST=0.0.0.0 CLI_PORT=21026 CLI_HOST=0.0.0.0 \
	STORAGE_PORT=21027 STORAGE_HOST=localhost \
	DRIVER_MODULE="@screeps/driver"
WORKDIR /screeps
#RUN apk add --no-cache git
COPY --from=0 /screeps /screeps
CMD ["npx","screeps","start"]
