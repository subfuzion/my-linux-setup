#!/bin/bash
set -e

usage() {
	echo Usage: "$(basename ${BASH_SOURCE[0]})" '<setup_home>'
}

exit_err() {
	echo "$1"
	usage
	exit "${2:-1}"
}

SETUP_HOME="$1"
if [[ -z "$SETUP_HOME" ]]; then
	exit_err "Error: missing arg"
fi

APP_NAME="$(basename $SETUP_HOME)"
CONF_DIR="$SETUP_HOME"/conf
TMPL_DIR="$SETUP_HOME"/tmpl


BASH_PROFILE="$HOME/.profile"
if [ -f "$HOME/.bash_profile" ]; then
	BASH_PROFILE="$HOME/.bash_profile"
fi

BASHRC="$HOME/.bashrc"

USER_PROFILE="$HOME/.$USER.profile"
USER_PROFILE_STR=$(printf '"$HOME/.%s.profile"' "$USER")

begin_custom_block() {
	f="$1"
        printf "\n# BEGIN $APP_NAME\n" >>"$f"
}

end_custom_block() {
	f="$1"
        printf "# END $APP_NAME\n" >> "$f"
}

write_generated_header() {
	f="$1"
	cat <<-EOS >"$f"
		# Generated by $APP_NAME
		# Do not edit; edit template instead:
		# $TMPL_DIR/profile
		#
	EOS
}

set_user_profile() {
	begin_custom_block "$BASH_PROFILE"
	printf 'if [[ "$MY_LINUX_SETUP" != "1" ]]; then' >>"$BASH_PROFILE"
	printf "\tsource $USER_PROFILE_STR\n" >>"$BASH_PROFILE"
	printf 'fi' >> "$BASH_PROFILE"
	end_custom_block "$BASH_PROFILE"

	begin_custom_block "$BASHRC"
	printf 'if [[ "$MY_LINUX_SETUP" != "1" ]]; then' >>"$BASHRC"
	printf "\tsource $USER_PROFILE_STR\n" >>"$BASHRC"
	printf 'fi' >> "$BASHRC"
	end_custom_block "$BASHRC"

	write_generated_header "$USER_PROFILE"
	cat "$TMPL_DIR"/profile >> "$USER_PROFILE"
}

copy_conf_files() {
	shopt -s dotglob
	for i in $(ls "$CONF_DIR/*" 2>/dev/null); do
		if [[ -r "$i" ]]; then
			cp -r "$i" "$HOME/"
		fi
	done
	shopt -u dotglob
}

configure_defaults() {
}

set_user_profile
copy_conf_files
configure_defaults
