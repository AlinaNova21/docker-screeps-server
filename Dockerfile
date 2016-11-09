FROM node:6
VOLUME /screeps
ENV AUTOUPDATE=1 \
    ASSET_DIR=/screeps/assets \
    MOD_DIR=/screeps/mods \
    GAME_PORT=21025 \
    GAME_HOST=0.0.0.0 \
    CLI_PORT=21026 \
    STORAGE_PORT=21027 \
    STORAGE_HOST=localhost

RUN npm install -g screeps
EXPOSE 21025 21026
ADD entrypoint.sh /entrypoint.sh
WORKDIR /screeps
ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
CMD ["screeps","start"]
