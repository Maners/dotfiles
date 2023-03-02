#!/usr/bin/env bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
BIN_HOME="$HOME/.local/bin"
DOTFILES=$PWD
PYTHON="python3.10" # python version for venv

function prepareEnvironment() {
    export COMPOSER_HOME="$XDG_CONFIG_HOME/composer"
}

function installAndConfigurePythonTools() {
    TOOLS="$XDG_DATA_HOME/python-venvs/vim"

    if ! rpm -q --quiet $PYTHON; then
        sudo dnf -y install $PYTHON
    fi

    rm -r $TOOLS
    $PYTHON -m venv --system-site-packages $TOOLS
    $TOOLS/bin/pip install "python-lsp-server[all]" "pylsp-mypy"
    ln -sf $TOOLS/bin/pylsp $BIN_HOME/pylsp
}

function installAndConfigurePHPTools() {
    if ! rpm -q --quiet composer; then
        sudo dnf -y install composer
    fi

    composer config --global bin-dir $BIN_HOME
    composer global require phpactor/phpactor
}

function installDependencies() {
    if ! rpm -q --quiet curl; then
        sudo dnf -y install curl
    fi
    if ! rpm -q --quiet nodejs; then
        sudo dnf install -y nodejs
    fi

    installAndConfigurePHPTools
    installAndConfigurePythonTools
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

    ln -sf $DOTFILES/config/nvim $XDG_CONFIG_HOME/nvim
}

function cleanEnvironment()
{
    rm -rf $XDG_CONFIG_HOME/nvim
    rm -rf $XDG_CONFIG_HOME/composer
    rm -rf $HOME/.composer

    rm -f $BIN_HOME/phpactor
    rm -f $BIN_HOME/phpstan
}

function doIt() {
    cleanEnvironment
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
