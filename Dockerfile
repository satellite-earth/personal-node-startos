FROM node:20.16-alpine3.20 AS builder

WORKDIR /app

RUN apk add --update --no-cache python3 make build-base

COPY ./config/.npmrc .
COPY ./core ./core
COPY ./web-ui ./web-ui
COPY ./personal-node ./personal-node

COPY ./config/pnpm-workspace.yaml .

RUN npm install -g pnpm
RUN pnpm install
RUN cd core && pnpm run build
RUN cd web-ui && pnpm run build
RUN cd personal-node && pnpm run build

FROM node:20.16-alpine3.20

COPY --from=builder /app /app

VOLUME [ "/data" ]
ENV DATA_DIR=/data

EXPOSE 80
ENV PORT=80
ENV TOR_PROXY=embassy:9050

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
