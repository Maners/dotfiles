#!/usr/bin/env bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
BIN_HOME="$HOME/.local/bin"
DOTFILES=$PWD
IS_DEB="false"

function checkPackageFormat()
{
    if command -v dpkg &> /dev/null; then
        IS_DEB="true"
        echo "This system uses Debian-based package format (.deb)."
        return 0
    fi

    if command -v rpm &> /dev/null; then
        IS_DEB="false"
        echo "This system uses Red Hat-based package format (.rpm)."
        return 0
    fi

    echo "Failed to determine package format"

    exit 1
}


function prepareEnvironment()
{
    export COMPOSER_HOME="$XDG_CONFIG_HOME/composer"
}

function installSystemPackage()
{
    local pkgname="$1"

    if $IS_DEB eq "false"; then
        if ! rpm -q --quiet $pkgname; then
            sudo dnf install -y $pkgname
        fi
    else
        if ! dpkg --verify $pkgname 2>/dev/null; then
            sudo apt -y install $pkgname
        fi
    fi
}

function installAndConfigurePHPTools()
{
    installSystemPackage "composer"

    composer global config bin-dir $BIN_HOME
    git clone git@github.com:phpactor/phpactor $HOME/projects/phpactor 
    composer global -d $HOME/projects/phpactor install
    ln -sf $HOME/projects/phpactor/bin/phpactor $BIN_HOME/phpactor
    echo "alias phptags='ctags -R --languages=PHP --kinds-PHP=-a --tag-relative=yes --exclude=".git" --fields=+aimSl'" >> $HOME/.bash_profile
}

function installDependencies()
{
    installSystemPackage "curl"
    installSystemPackage "nodejs" # for CoC plugin
    installSystemPackage "git"

    # Vim
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # NeoVim
    curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#    installAndConfigurePHPTools
}

# Use symlinks instead of copying, so that any configuration changes outside
# of the "dotfiles" checkout are still tracked in the "dotfiles"
function linkConfigFiles()
{
    ln -sf $DOTFILES/home/.vimrc $HOME/.vimrc

    ln -sf $DOTFILES/config/nvim $XDG_CONFIG_HOME/nvim
}

function cleanEnvironment()
{
    rm -rf $XDG_CONFIG_HOME/nvim
    rm -rf $XDG_CONFIG_HOME/composer
    rm -rf $HOME/.composer

    rm -f $BIN_HOME/phpactor
    rm -f $BIN_HOME/phpstan
    rm -f $BIN_HOME/composer
}

function doIt()
{
    cleanEnvironment
    prepareEnvironment
    linkConfigFiles
    installDependencies
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
