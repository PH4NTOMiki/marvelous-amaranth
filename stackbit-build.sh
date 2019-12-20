#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dfd38d135ec380019408dea/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dfd38d135ec380019408dea
curl -s -X POST https://api.stackbit.com/project/5dfd38d135ec380019408dea/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5dfd38d135ec380019408dea/webhook/build/publish > /dev/null
