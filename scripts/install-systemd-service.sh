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
    echo "It should be the name of the .jar file to run."
    exit 1
fi

if [ -z "${MINECRAFT_SERVICE_JAVA_RAM}" ]; then
    echo "Required variable 'MINECRAFT_SERVICE_JAVA_RAM' is missing."
    echo "It should be the amount of RAM to be used by Minecraft, in Java notation."
    echo "For example:"
    echo "  1024K -> 1024 kilobytes"
    echo "  512M -> 512 megabytes"
    echo "  8G -> 8 gigabytes"
fi

echo "Preparing to install Minecraft Service"
echo "   Service User: ${MINECRAFT_SERVICE_USER}"
echo "  Service Group: ${MINECRAFT_SERVICE_GROUP}"
echo "      Java Path: ${MINECRAFT_SERVICE_JAVA_PATH}"
echo "    Server Root: ${MINECRAFT_SERVICE_ROOT}"
echo "    Binary Name: ${MINECRAFT_SERVICE_BINARY_NAME}"
echo "   Assigned RAM: ${MINECRAFT_SERVICE_JAVA_RAM}"
echo ""

echo "Creating minecraft.service inside /etc/systemd/system/minecraft.service"
envsubst < ../assets/minecraft.service > /etc/systemd/system/minecraft.service
echo ""

echo "Enabling minecraft.service"
systemctl enable minecraft.service
echo ""
echo "Done"
