#!/bin/bash

WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${WORKING_DIR}/internal/init.sh"

THING_TO_FETCH=""

#-------------------------------------------------------------------------------
# functions
#

function parse_args() {
  if [[ -z "${1}" ]] ; then
    error_exit "No file specified"
  fi

  THING_TO_FETCH="${1}"
}

function fetch() {
  scp -rp "${TARGET_USER}@${TARGET_IP}:${THING_TO_FETCH}" "${UTIL_DIR}/data/"

  local RC=${?}
  if [[ ${RC} -ne 0 ]] ; then
    error_exit "Couldn't find '${THING_TO_FETCH}' on server '${TARGET_IP}'" ${RC}
  else
    printf "\n info | File(s) fetched\n\n"
  fi
}

#-------------------------------------------------------------------------------
# main
#

function main() {
  parse_args "${@}"
  fetch
}

# main "${@}" 2>&1 | tee -a run.log
main "${@}"

#
################################################################################
