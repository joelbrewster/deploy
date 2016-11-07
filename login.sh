#!/bin/bash

WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${WORKING_DIR}/internal/init.sh"

ssh "${TARGET_USER}@${TARGET_IP}"
