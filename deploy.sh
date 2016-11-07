#!/bin/bash

WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${WORKING_DIR}/internal/init.sh"

SOURCE_FILE=""

#-------------------------------------------------------------------------------
# functions
#

function parse_args() {
  if [[ -z "${1}" ]] ; then
    error_exit "No file specified"
  elif [[ ! -f "${1}" ]] ; then
    error_exit "Argument '${1}' was not a file"
  fi

  SOURCE_FILE="${1}"
}

function deploy() {
  scp "${SOURCE_FILE}" "${TARGET_CMD}"

  local RC=${?}
  if [[ ${RC} -ne 0 ]] ; then
    error_exit "Couldn't deploy '${SOURCE_FILE}' to server '${TARGET_IP}'" ${RC}
  else
    printf "\n info | File deployed\n\n"
  fi
}

#-------------------------------------------------------------------------------
# main
#

function main() {
  parse_args "${@}"
  deploy
}

# main "${@}" 2>&1 | tee -a run.log
main "${@}"

#
################################################################################
