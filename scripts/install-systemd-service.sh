#!/usr/bin/env bash

set -e
source "$(dirname "${BASH_SOURCE[0]}")"/internal/env.sh

check-required-variable "MINECRAFT_SERVICE_USER"
check-required-variable "MINECRAFT_SERVICE_GROUP"
check-required-variable "MINECRAFT_SERVICE_JAVA_PATH"
check-required-variable "MINECRAFT_SERVICE_ROOT"
check-required-variable "MINECRAFT_SERVICE_BINARY_NAME"
check-required-variable "MINECRAFT_SERVICE_JAVA_RAM"

echo "Preparing to install Minecraft Service"
echo "   Service User: ${MINECRAFT_SERVICE_USER}"
echo "  Service Group: ${MINECRAFT_SERVICE_GROUP}"
echo "      Java Path: ${MINECRAFT_SERVICE_JAVA_PATH}"
echo "    Server Root: ${MINECRAFT_SERVICE_ROOT}"
echo "    Binary Name: ${MINECRAFT_SERVICE_BINARY_NAME}"
echo "   Assigned RAM: ${MINECRAFT_SERVICE_JAVA_RAM}"
echo ""

echo "Creating minecraft.service inside /etc/systemd/system/minecraft.service"
envsubst < ./assets/minecraft.service > /etc/systemd/system/minecraft.service
echo ""

echo "Enabling minecraft.service"
systemctl enable minecraft.service
echo ""
echo "Done"
