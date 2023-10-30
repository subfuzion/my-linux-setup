#!/bin/bash
set -eu

SETUP_HOME=$(cd -- "$(dirname -- ${BASH_SOURCE[0]})" &>/dev/null && pwd)

APP_NAME="$(basename $SETUP_HOME)"

#echo "[ INFO ] Installing packages"
#"$SETUP_HOME"/bin/install.sh

echo "[ INFO ] Configuring shell"
"$SETUP_HOME"/bin/setup-profile.sh "$SETUP_HOME"

cat <<EOS
[  OK  ] Setup is done. To reload your login shell, enter:

	exec bash -l

EOS
