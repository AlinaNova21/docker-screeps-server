FROM node:6.6
VOLUME /screeps
WORKDIR /app
RUN npm install screeps
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
CMD ["screeps","start"]
