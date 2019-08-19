#!/usr/bin/env bash

set -e
source "$(dirname "${BASH_SOURCE[0]}")"/internal/env.sh

check-required-variable "MINECRAFT_SERVICE_RCON_PASSWORD"

function run {
    mcrcon -H localhost -p "${MINECRAFT_SERVICE_RCON_PASSWORD}" "$1"
}

run "say Server will shut down in 15 seconds"
sleep 5
run "say Server will shut down in 10 seconds"
sleep 5
run "say Server will shut down in 5 seconds"
sleep 5
run "say Shutting down"
run "save-all"
run "stop"
