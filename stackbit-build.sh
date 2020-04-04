#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e8835498c1e2c00122c26f5/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e8835498c1e2c00122c26f5
curl -s -X POST https://api.stackbit.com/project/5e8835498c1e2c00122c26f5/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e8835498c1e2c00122c26f5/webhook/build/publish > /dev/null
