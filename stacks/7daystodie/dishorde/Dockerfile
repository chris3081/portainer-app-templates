FROM node:12-stretch-slim

ARG IP=7dtdserver
ARG PASSWORD=changeme
ARG TOKEN=your_token_here
ARG CHANNEL=channelid
ARG PORT=8081
ARG VERSION=v2.0.1

WORKDIR /bot
RUN apt update && apt install -y wget jq; npm install
RUN wget --content-disposition https://github.com/LakeYS/Dishorde/releases/download/$VERSION/Dishorde.tar.gz -O - | tar -xz --strip-components 1

# Configure the bot

RUN jq --arg IP $IP  -r '.ip |= $IP' /bot/config.json > /bot/config_tmp.json; \
    jq --arg PASSWORD $PASSWORD  -r '.password |= $PASSWORD' /bot/config.json > /bot/config_tmp.json; \
    jq --arg TOKEN $TOKEN  -r '.token |= $TOKEN' /bot/config.json > /bot/config_tmp.json; \
    jq --arg CHANNEL $CHANNEL  -r '.channel |= $CHANNEL' /bot/config.json > /bot/config_tmp.json; \
    jq --arg PORT $PORT  -r '.port |= $PORT' /bot/config.json > /bot/config_tmp.json; \
    mv /bot/config_tmp.json /bot/config.json
 
ENTRYPOINT ['/usr/local/bin/node', 'index.js']
CMD cp /data/config.json /bot/config.json && node ./index.js