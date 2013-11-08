# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias phptags='ctags -R --languages=PHP --tag-relative=yes --PHP-kinds=+cfid-jv --exclude=".git" --fields=+l'
