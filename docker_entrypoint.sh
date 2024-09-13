#!/bin/sh

cd /app/packages/apps/personal-node

export TOR_ADDRESS=$(yq e '.tor-address' /root/start9/config.yaml)

node .
