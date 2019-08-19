#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"/../..

export MINECRAFT_SERVICE_USER=root
export MINECRAFT_SERVICE_GROUP=root
export MINECRAFT_SERVICE_JAVA_PATH=$(which java)
export MINECRAFT_SERVICE_ROOT=$(pwd)

set -o allexport
source .env
set +o allexport

source ./scripts/internal/common.sh
