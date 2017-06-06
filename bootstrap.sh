#!/usr/bin/env bash

files=".vimrc .vim .bashrc"
dir=`"pwd"`

function doIt() {
    for file in $files; do
        rm -rf ~/$file
        ln -sf $dir/$file ~/$file
    done

    nvim_config="$HOME/.config/nvim/init.vim"
    mkdir -p $(dirname "${nvim_config}")

    cat <<EOM > $nvim_config
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
set termguicolors
source ~/.vimrc
EOM
    source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
            source ~/.bashrc
    fi
fi
unset doIt
