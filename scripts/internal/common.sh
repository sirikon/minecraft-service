#!/usr/bin/env bash

set -e

function check-required-variable {
    CONTENT=${!1}
    if [ -z "${CONTENT}" ]; then
        echo "Required variable '$1' is missing."
        exit 1
    fi
}
