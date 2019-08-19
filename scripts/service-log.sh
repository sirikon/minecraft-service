#!/usr/bin/env bash

set -e

journalctl -u minecraft $@
