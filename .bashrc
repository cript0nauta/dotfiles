#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

nixwhich(){
    readlink -f "$(command -v "${1}")" | cut -d/ -f1-4
}

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export HISTFILESIZE=30000
export HISTSIZE=30000
export HISTCONTROL=ignorespace
export HISTTIMEFORMAT='%Y-%m-%d: '

export EDITOR=vim

shopt -s globstar

source ~/git-prompt.sh
