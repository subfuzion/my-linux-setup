#!/bin/bash
set -eu

sudo apt -y update && sudo apt -y install \
	build-essential \
	curl \
	tmux \
	vim


sudo update-alternatives --set editor /usr/bin/vim.basic
