#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip zsh fonts-powerline python3-pip python2 -y
sudo apt-get remove vim --autoremove -y

sudo python3 -m pip install python-language-server pylint

chsh -s /usr/bin/zsh

mkdir -p ~/Downloads

cd ~/Downloads

wget https://nodejs.org/dist/v14.17.1/node-v14.17.1-linux-x64.tar.xz
tar -xf node-v14.17.1-linux-x64.tar.xz

cp -r node-v14.17.1-linux-x64/* ~/.local/

wget https://github.com/neovim/neovim/archive/refs/tags/nightly.tar.gz
tar -xf nightly.tar.gz

cd neovim-nightly
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

nvim --version
