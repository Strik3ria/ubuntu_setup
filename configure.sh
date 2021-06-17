#!/bin/bash

set -e

initLocation=$(pwd)
PLUG=~/.zsh/plugins
SOURCE=~/source/git
CONFIG=~/.config

rm -rf $PLUG
rm -rf $CONFIG

mkdir -p $PLUG
cd $PLUG

plugins="zsh-users/zsh-autosuggestions zsh-users/zsh-completions zsh-users/zsh-syntax-highlighting eendroroy/alien"

for plugin in $plugins; do
    git clone "https://github.com/$plugin";
done

cd $PLUG/alien/libs

git clone https://github.com/eendroroy/promptlib-zsh.git promptlib
git clone https://github.com/chrissicool/zsh-256color.git
git clone https://github.com/mafredri/zsh-async.git

cd $initLocation

cp ./files/.zshrc ~/.zshrc

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
