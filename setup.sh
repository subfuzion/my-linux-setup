#!/bin/bash
set -eu

SCRIPT_DIR=$(cd -- "$(dirname -- ${BASH_SOURCE[0]})" &>/dev/null && pwd)
APP_NAME="$(basename $SCRIPT_DIR)"

"$SCRIPT_DIR"/install.sh
"$SCRIPT_DIR"/setup-profile.sh

echo Done.
