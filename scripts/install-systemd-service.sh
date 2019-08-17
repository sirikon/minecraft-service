#!/usr/bin/env bash

set -e
DIR="$(dirname "${BASH_SOURCE[0]}")"/../server
mkdir -p "${DIR}"
cd "${DIR}"

export MINECRAFT_SERVICE_USER=root
export MINECRAFT_SERVICE_GROUP=root
export MINECRAFT_SERVICE_JAVA_PATH=$(which java)
export MINECRAFT_SERVICE_ROOT=$(pwd)

set -o allexport
source ../.env
set +o allexport

if [ -z "${MINECRAFT_SERVICE_BINARY_NAME}" ]; then
    echo "Required variable 'MINECRAFT_SERVICE_BINARY_NAME' is missing."
    exit 1
fi

envsubst < ../assets/minecraft.service > /etc/systemd/system/minecraft.service
systemctl enable minecraft.service
