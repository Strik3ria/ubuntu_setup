#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip zsh fonts-powerline python3-pip python2 exuberant-ctags clangd-12 -y
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
sudo apt-get remove vim --autoremove -y

sudo python3 -m pip install python-lsp-server pylint flake8 mypy pyls-isort \
python-lsp-black pyls-memestra

sudo python3 -m pip uninstall tomli
sudo python3 -m pip install 'tomli<2.0.0,>=0.2.6'

chsh -s /usr/bin/zsh

mkdir -p ~/Downloads

cd ~/Downloads

NODE_VERSION='v16.13.2'

wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz
tar -xf node-${NODE_VERSION}-linux-x64.tar.xz

sudo cp -r node-${NODE_VERSION}-linux-x64/* /usr/

git clone https://github.com/neovim/neovim

cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

cd .. && rm -rf neovim

nvim --version
