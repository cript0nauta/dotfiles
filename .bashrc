#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

nixwhich(){
    readlink -f "$(command -v "${1}")" | cut -d/ -f1-4
}

promptalarm(){
    PS1='\a\n'$PS1
}

isinsidescript(){
    cat /proc/$(cat /proc/$$/stat | awk '{ print $4 }')/cmdline |
        grep -q '^script'
}

bak(){
    cp --backup=numbered "${1}" "${1}.bak";
}

alias ls='ls --color=auto'
alias gcloc='cloc --vcs=git'
type doas >/dev/null 2>&1 && alias sudo=doas
PS1='[\u@\h \W]\$ '
export HISTFILESIZE=30000
export HISTSIZE=30000
export HISTCONTROL=ignorespace
export HISTTIMEFORMAT='%Y-%m-%d: '

export EDITOR=vim

shopt -s globstar

source ~/git-prompt.sh
isinsidescript && PS1='(script) '$PS1
