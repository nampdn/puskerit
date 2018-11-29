FROM node:11-alpine

RUN apk add --no-cache bash git openssh-client

ADD puskerit /usr/local/bin/
