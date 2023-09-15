#!/bin/bash
set -eu

sudo apt -y update && sudo apt -y install \
	apt-transport-https \
	build-essential \
	ca-certificates \
	curl \
	flex bison \
	git \
	gnupg \
	net-tools \
	sudo \
	tmux \
	vim

sudo apt autoremove

# git
touch ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# gcloud
# https://cloud.google.com/sdk/docs/install#deb
# https://cloud.google.com/sdk/docs/downloads-interactive
# https://cloud.google.com/sdk/docs/downloads-interactive#silent
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
     | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
     | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-cli

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
