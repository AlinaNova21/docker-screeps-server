FROM node:8
VOLUME /screeps
WORKDIR /app
RUN npm install screeps
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
CMD ["screeps","start"]
