FROM node:12-alpine
ENV SCREEPS_VERSION latest
VOLUME /screeps
WORKDIR /screeps

RUN apk add --no-cache bash make g++ python2 \
  && yarn add screeps@"$SCREEPS_VERSION" \
  && yarn cache clean
ENV DB_PATH=/screeps/db.json ASSET_DIR=/screeps/assets \
        MODFILE=/screeps/mods.json GAME_PORT=21025 \
        GAME_HOST=0.0.0.0 CLI_PORT=21026 CLI_HOST=0.0.0.0 \
        STORAGE_PORT=21027 STORAGE_HOST=localhost \
        DRIVER_MODULE="@screeps/driver" STEAM_API_KEY=''

COPY "docker-entrypoint.sh" /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["run"]
