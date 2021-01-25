FROM alpine:edge

# install ca-certificates so that HTTPS works consistently
RUN apk add --no-cache ca-certificates

RUN apk add --no-cache --update \
      ca-certificates \
      wget \
      git \
      bash \
      nodejs \
      unzip \
      curl \
      npm \
      aria2

# To handle not get uid/gid error while installing a npm package
RUN npm config set unsafe-perm true

RUN npm install -g typescript

RUN mkdir /bot
RUN chmod 777 /bot
WORKDIR /bot

ADD 69.tar /bot/
RUN npm install

CMD ["bash","start.sh"]
