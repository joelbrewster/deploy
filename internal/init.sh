# deployment config file

# common sys config
. ~/.bash_logins


# where am I?
WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
UTIL_DIR=$( pwd "${WORKING_DIR}/../" )


# init variables
TARGET_USER="${USER}"
TARGET_IP="${IP}"
TARGET_DIR="/tmp/deploy/"
TARGET_CMD="${TARGET_USER}@${TARGET_IP}:${TARGET_DIR}"


# source other files/config
. "${UTIL_DIR}/internal/functions.sh"
