
# Check for an interactive session
[ -z "$PS1" ] && return
# GIT support
export GIT_PS1_SHOWDIRTYSTATE=1
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

alias ls='ls --color=auto'
alias ll='ls -l -h --color=auto'
alias gitlog='git log -10 --pretty=format:"%h - %an, %ar : %s" --graph'
alias gitdiff='git diff | kompare - > /dev/null'
alias pylintlocal="pylint -rn *.py | grep -v 'Locally disabling' "
alias pylintscore="pylint *.py | grep 'our code has been rated' "
alias usbmount="mount /media/usb01"
alias usbumount="umount /media/usb01"
alias gvimr="gvim --remote-tab"
PS1='$(__git_ps1)\[\e[0;32m\][\t]\u\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]\$\[\e[m\]:\[\e[0;37m' 
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PYTHONPATH=/home/dimert/NMS/nms_app:/home/dimert/NMS/
