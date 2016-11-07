# common functions

function error_exit() {
  if [[ -z ${1} ]] ; then
    printf "\n err  | Uncaught error\n\n"
    exit 1
  else
    printf "\n err  | ${1}\n\n"

    if [[ ! -z ${2} ]] ; then
      exit ${2}
    else
      exit 1
    fi
  fi
}
