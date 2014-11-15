
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
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#\e[47m
# Custom bash prompt via kirsle.net/wizards/ps1.html
#export PS1="\[$(tput bold)\]$(__git_ps1) \[$(tput setaf 2)\]\t \[$(tput setaf 2)\][\[$(tput setaf 2)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 2)\]\h \[$(tput setaf 6)\]\W\[$(tput setaf 2)\]]\[$(tput setaf 4)\]\\$ \[$(tput sgr0)\]"
#export PS1="$(__git_ps1)\[$(tput bold)\]\[$(tput setaf 1)\]\t \[$(tput setaf 2)\][\[$(tput setaf 3)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 3)\]\h \[$(tput setaf 6)\]\W\[$(tput setaf 2)\]]\[$(tput setaf 4)\]\\$ \[$(tput sgr0)\]"
PS1='$(__git_ps1)[\t]\[\e[0;32m\]\u@\h\[\e[m\]\[\e[1;34m\]:\W\[\e[m\]\[\e[1;32m\]\$\[\e[m\]:\[\e[0;37m' 
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PYTHONPATH=/home/dimert/NMS/nms_app:/home/dimert/NMS/
