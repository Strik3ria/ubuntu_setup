#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip zsh fonts-powerline python3-pip -y
sudo apt-get remove vim --autoremove -y

sudo python3 -m pip install python-language-server pylint

chsh -s /usr/bin/zsh

mkdir -p ~/Downloads

cd ~/Downloads

wget https://github.com/neovim/neovim/archive/refs/tags/nightly.tar.gz
tar -xf nightly.tar.gz

cd neovim-nightly
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

nvim --version
