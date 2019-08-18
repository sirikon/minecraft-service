#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"/..

function print-available-backups {
    echo "Available backups:"
    ls -lAh --sort=time ./backups | awk '{gsub(".zip","",$9); print $9, "["$5"]"}' | tail -n +2
}

BACKUP_NAME=$1

if [ -z "${BACKUP_NAME}" ]; then
    echo "Usage: ./restore.sh <backup name>"
    echo ""
    print-available-backups
    exit 1
fi

BACKUP_FILE="./backups/${BACKUP_NAME}.zip"

if [ ! -f "${BACKUP_FILE}" ]; then
    echo "Backup ${BACKUP_NAME} (${BACKUP_FILE}) doesn't exist."
    echo ""
    print-available-backups
    exit 1
fi

echo "About to restore backup '${BACKUP_NAME}'"
echo "**ALL** files in server directory will be deleted before restoring."
echo ""
read -p "Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -r ./server
    unzip "${BACKUP_FILE}" -d ./server
    echo ""
    echo "Restore complete."
fi
