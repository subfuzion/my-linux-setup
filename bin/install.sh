#!/bin/bash
set -eu

sudo apt -y update && sudo apt -y install \
	build-essential \
	ca-certificates \
	curl \
	git \
	gnupg \
	tmux \
	vim

sudo apt autoremove

# git
touch ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# go
# TODO: grep for latest version and apply to url
# could just use apt, but it always seems to be one or two releases behind
sudo rm -rf /usr/local/go && \
	sudo curl -Lo- https://go.dev/dl/go1.20.6.linux-amd64.tar.gz | \
	sudo tar -C /usr/local -xzf -

# node / nvm
# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
nvm install node
npm install -g npm@latest

# configure defaults
sudo update-alternatives --set editor /usr/bin/vim.basic
