export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dmitryhd2"

DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git command-not-found dirhistory git pip pylint python kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration
# Directory stack enable
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/dkhodakov/.local/bin"
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

alias h="history | tail -30"
alias py="ipython3 --no-banner"
alias runipython='jupyter notebook --notebook-dir="~/repos/" --port=9999'
alias runjupyter='jupyter notebook --notebook-dir="~/repos/" --port=9999'
alias ll="ls -lvGh --group-directories-first"
alias htop='htop -d 3'

# GIT alias
alias gitst="git diff --stat"
alias gitdi="git diff"
alias gitci="git commit -a "
alias gitcim="git commit -a -m"
alias gitco="git checkout "
alias gitlo="git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short -40"
alias gitbr="git branch -v"
alias githist='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias gittags='git tag -n'
alias gitdiff='git diff'

# SSH alias
alias crmssh="ssh -A slauncher@analytic-crm -t 'cd /var/local/crm/avito-crm/; bash'"
alias ctrssh="ssh -A slauncher@crm-training01 -t 'bash'"
alias ctrssh1="ssh -A slauncher@crm-training01 -t 'bash'"
alias ctrssh2="ssh -A slauncher@crm-training02 -t 'bash'"
alias ctrssh3="ssh -A slauncher@crm-training03 -t 'bash'"
alias ctrssh4="ssh -A slauncher@crm-training04 -t 'bash'"
alias ctrssh5="ssh -A slauncher@crm-training05 j-t 'bash'"
alias robotssh="ssh -A analytic-robots"

# projects aliases
#hash -d crmdir=/var/local/crm/

export EDITOR=vim
export GOPATH=$HOME/repos/go

# Work
ODBCDIR=$HOME
export ODBCSYSINI=$ODBCDIR
export ODBCINI=$ODBCDIR/odbc.ini
export VERTICAINI=$ODBCDIR/odbc.ini

ssh-add 2> /dev/null

export PIP_INDEX_URL=http://pypi.msk.avito.ru:8090/pypi/
export PIP_TRUSTED_HOST=pypi.msk.avito.ru

#eval $(minikube docker-env)

# Python con
export PYTHONDONTWRITEBYTECODE=1

# pyenv
export PATH="/home/dkhodakov/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/repos
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /home/dkhodakov/.local/bin/activate.sh

export PATH=/home/dkhodakov/miniconda3/bin:$PATH
