# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias phptags='~/bin/ctags -R --languages=PHP --tag-relative=yes --PHP-kinds=+cfidn --exclude=".git" --fields=+aimSl'
