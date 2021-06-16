#!/bin/bash

set -e

PLUG=~/.zsh/plugins
SOURCE=~/source/git
CONFIG=~/.config

rm -rf $PLUG
rm -rf $CONFIG
rm -rf $SOURCE

mkdir -p $PLUG
cd $PLUG

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/eendroroy/alien.git

cd $PLUG/alien/libs

git clone https://github.com/eendroroy/promptlib-zsh.git promptlib
git clone https://github.com/chrissicool/zsh-256color.git
git clone https://github.com/mafredri/zsh-async.git

cp ~/ubuntu_setup/files/.zshrc ~/.zshrc

mkdir -p $CONFIG

cd $CONFIG

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

git clone git@github.com:TechnicalIllusion/nvim.git

nvim +PlugInstall

/usr/bin/python3 -m pip install pynvim
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py

sudo python2 get-pip.py
/usr/bin/python2 -m pip install pynvim

sudo npm i -g typescript-language-server typescript neovim

mkdir -p $SOURCE

rm -rf ~/Downloads/*night*
