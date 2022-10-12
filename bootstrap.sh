#!/usr/bin/env bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
BIN_HOME="$HOME/.local/bin"
DOTFILES=$PWD

function prepareEnvironment() {
    export COMPOSER_HOME="$XDG_CONFIG_HOME/composer"
}

function installDependencies() {
    if ! rpm -q --quiet composer; then
        sudo dnf -y install composer
    fi 

    if ! rpm -q --quiet curl; then
        sudo dnf -y install curl
    fi

    if ! rpm -q --quiet python3-lsp-server; then
        sudo dnf -y install python3-lsp-server
    fi

    composer config --global bin-dir $BIN_HOME

    composer global -d $DOTFILES/phpactor install
    composer global require phpstan/phpstan

    ln -sf $DOTFILES/phpactor/bin/phpactor $BIN_HOME/phpactor

}

function applyDattoCustomizations() {
    composer config --global repositories.datto composer https://packagist.datto.net
}

# Use symlinks instead of copying, so that any configuration changes outside
# of the "dotfiles" checkout are still tracked in the "dotfiles"
function linkConfigFiles() {
    ln -sf $DOTFILES/home/.vimrc $HOME/.vimrc
    ln -sf $DOTFILES/home/.bashrc $HOME/.bashrc
    ln -sf $DOTFILES/home/.bash_profile $HOME/.bash_profile

    rm -rf $XDG_CONFIG_HOME/nvim
    ln -sf $DOTFILES/config/nvim $XDG_CONFIG_HOME/nvim

    rm -rf $XDG_CONFIG_HOME/composer
    ln -rf $DOFILES/config/composer $XDG_CONFIG_HOME/composer
}

function doIt() {
    prepareEnvironment
    linkConfigFiles
    installDependencies
    applyDattoCustomizations
    source ~/.bash_profile
    source ~/.bashrc
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
