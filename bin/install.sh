#!/bin/bash
set -eu

sudo apt -y update && sudo apt -y install \
	build-essential \
	curl \
	tmux \
	vim

# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
nvm install node

sudo update-alternatives --set editor /usr/bin/vim.basic
