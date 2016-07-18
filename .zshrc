export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dmitryhd"

DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git command-not-found dirhistory git pip pylint python)

source $ZSH/oh-my-zsh.sh

# User configuration
# Directory stack enable
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export MANPATH="/usr/local/man:$MANPATH"

alias deploy="make deploy"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
#
alias h="history | tail -30"
alias py="ipython3 --no-banner"

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
# 

alias zsh-reload="source ~/.zshrc"

# projects aliases
hash -d conf=~/repos/configs/
hash -d vac=~/repos/vacancy_analysis
hash -d crm=~/repos/avito-crm/
hash -d crmdir=/var/local/crm/

# export PYTHONPATH=/home/dkhodakov/repos/avito-crm/
# aliases
#pylint() pylint -rn --output-format=colorized "$@" | grep -v 'Locally disabling'

zssh() ssh "$@" -t zsh

CRMPATH=/var/local/crm/avito-crm
alias cdcrm="cd $CRMPATH"

# Avito files
alias crmssh="ssh slauncher@analytic-crm -t 'cd /var/local/crm/avito-crm/; bash'"
alias atrssh="ssh slauncher@avi-training01 -t 'bash'"
alias ctrssh="ssh slauncher@crm-training01 -t 'bash'"
alias robotssh="ssh analytic-robots"


# alias startvertica="sudo -u dbadmin /opt/vertica/bin/admintools -t start_db -d vert_test"
# alias avito.backup="cd /home/ && tar -czf - ./dkhodakov | (pv -p --timer --rate --bytes > /media/dkhodakov/backup/avito_laptop/dkhodakov-$(date +"%Y.%d.%m-%H.%M").tgz); echo /media/dkhodakov/backup/avito_laptop/dkhodakov-$(date +"%Y.%d.%m-%H.%M").tgz"

export EDITOR=vim
export GOPATH=$HOME/repos/go

# Python con
export NOSE_REDNOSE=1
export PYTHONDONTWRITEBYTECODE=1

alias runipython='jupyter notebook --notebook-dir="~/repos/" --port=9999'
alias pylint="pylint -rn --output-format=colorized"
alias pylintlocal="pylint -rn *.py | grep -v 'Locally disabling' "
alias pylintscore="pylint *.py | grep 'our code has been rated' "
alias nose-full="nosetests-3.4 --with-coverage --cover-package=avitocrm --cover-erase --cover-inclusive -v"
alias nose="nosetests-3.4 --with-coverage --cover-package=avitocrm --cover-erase --failed --cover-inclusive -vx tests"

ODBCDIR=$HOME
export ODBCSYSINI=$ODBCDIR
export ODBCINI=$ODBCDIR/odbc.ini
export VERTICAINI=$ODBCDIR/odbc.ini

# For virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/repos
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
