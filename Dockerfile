FROM node:20.16-alpine3.20 AS builder

WORKDIR /app

RUN apk add --update --no-cache python3 make build-base

COPY ./packages ./packages

RUN npm install -g pnpm
RUN cd packages && make install
RUN cd packages && make build

FROM node:20.16-alpine3.20 AS main

COPY --from=builder /app /app

VOLUME [ "/data" ]
ENV DATA_DIR=/data

EXPOSE 80
ENV PORT=80
ENV TOR_PROXY=embassy:9050

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
