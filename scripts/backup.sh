#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"/../server
mkdir -p ../backups

BACKUP_NAME=$(date +"%Y-%m-%d_%H-%M-%S")

zip "../backups/${BACKUP_NAME}.zip" -r .

echo ""
echo "Created backup: ${BACKUP_NAME}"
