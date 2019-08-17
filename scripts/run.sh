#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"/../server

set -o allexport
source ../.env
set +o allexport

java \
    -Xms${MINECRAFT_SERVICE_JAVA_RAM} \
    -Xmx${MINECRAFT_SERVICE_JAVA_RAM} \
    -XX:+UseG1GC \
    -XX:+UnlockExperimentalVMOptions \
    -XX:MaxGCPauseMillis=100 \
    -XX:+DisableExplicitGC \
    -XX:TargetSurvivorRatio=90 \
    -XX:G1NewSizePercent=50 \
    -XX:G1MaxNewSizePercent=80 \
    -XX:G1MixedGCLiveThresholdPercent=35 \
    -XX:+AlwaysPreTouch \
    -XX:+ParallelRefProcEnabled \
    -Dusing.aikars.flags=mcflags.emc.gs \
    -jar ${MINECRAFT_SERVICE_BINARY_NAME}
