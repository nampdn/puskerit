FROM node:17-alpine

RUN apk add --no-cache bash git openssh-client

ADD puskerit /usr/local/bin/

RUN chmod +x /usr/local/bin/puskerit
