FROM node:6
VOLUME /screeps
ENV AUTOUPDATE=1 \
    DB_PATH=/screeps/db.json \
    ASSET_DIR=/screeps/assets \
    MOD_DIR=/screeps/mods \
    GAME_PORT=21025 \
    GAME_HOST=0.0.0.0 \
    CLI_PORT=21026 \
    STORAGE_PORT=21027 \
    STORAGE_HOST=localhost

WORKDIR /app
RUN npm install screeps
EXPOSE 21025 21026
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
CMD ["screeps","start"]
