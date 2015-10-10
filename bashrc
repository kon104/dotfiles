##
## .bashrc
##

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Prompt
PS1="[\u@\h:\W]$ "

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -lF'
alias la='ls -lFa'

# Set the environments which depends on the OS.
if [ `uname` = "Linux" ]; then
	alias ls='ls --color=none'
fi

if [ `uname` = "Darwin" ]; then
	export LANG=ja_JP.UTF-8
fi
