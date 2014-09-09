
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias ll='ls -l -h --color=auto'
alias gitlog='git log -10 --pretty=format:"%h - %an, %ar : %s" --graph'
alias gitdiff='git diff | kompare - > /dev/null'
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#\e[47m
PS1='\[\e[0;32m\][\t]\u\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]\$\[\e[m\]:\[\e[0;37m' 
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PYTHONPATH=/home/dimert/repos/NMS/nms_app