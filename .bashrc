#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export HISTFILESIZE=30000
export HISTSIZE=30000
export HISTCONTROL=ignorespace
export HISTTIMEFORMAT='%Y-%m-%d: '

export EDITOR=vim

shopt -s globstar

source ~/git-prompt.sh
