#!/usr/bin/env bash
files=".vimrc .vim .bashrc"
dir=`"pwd"`
cd $dir
git pull origin master
function doIt() {
		for file in $files; do
			rm -rf ~/$file
			ln -s $dir/$file ~/$file
		done
#    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
#            --exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
# for neovim
    ln -s ~/.vim ~/.config/nvim
    ln -s ~/.vimrc ~/.config/init.nvim
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
