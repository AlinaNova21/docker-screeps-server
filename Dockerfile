FROM node:12-alpine
ENV SCREEPS_VERSION latest
WORKDIR /screeps
RUN apk add --no-cache g++ make python2
RUN yarn add screeps@"$SCREEPS_VERSION"

FROM node:12-alpine
VOLUME /screeps
WORKDIR /screeps
ENV DB_PATH=/screeps/db.json ASSET_DIR=/screeps/assets \
        MODFILE=/screeps/mods.json GAME_PORT=21025 \
        GAME_HOST=0.0.0.0 CLI_PORT=21026 CLI_HOST=0.0.0.0 \
        STORAGE_PORT=21027 STORAGE_HOST=localhost \
        DRIVER_MODULE="@screeps/driver" STEAM_API_KEY=''
WORKDIR /screeps
#RUN apk add --no-cache git
COPY --from=0 /screeps /screeps

COPY "docker-entrypoint.sh" /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["run"]
