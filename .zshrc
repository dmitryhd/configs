export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dmitryhd"

DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git command-not-found dirhistory git pip pylint python)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export NOSE_REDNOSE=1
export PYTHONDONTWRITEBYTECODE=1
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Directory stack enable
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'

alias pylint="pylint -rn --output-format=colorized"
alias pylintlocal="pylint -rn *.py | grep -v 'Locally disabling' "
alias pylintscore="pylint *.py | grep 'our code has been rated' "
alias usbmount="sudo mount /media/usb01"
alias usbumount="sudo umount /media/usb01"
alias gvimr="gvim --remote-tab"

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

alias h="history | tail -30"
# 
alias confchange="cd ~conf && ./configs_upload.sh && git commit -a -m 'changed' && git push && git push github master && cd ~1"

alias zsh-reload="source ~/.zshrc"
alias nose-full="nosetests-3.4 --with-coverage --cover-package=avitocrm --cover-erase --cover-inclusive -v"
alias nose="nosetests-3.4 --with-coverage --cover-package=avitocrm --cover-erase --failed --cover-inclusive -vx tests"
alias deploy="make deploy"
hash -d usb=/media/usb01
hash -d data=/media/data_drive/
hash -d conf=~/repos/configs/

# projects aliases
hash -d vac=~/repos/vacancy_analysis
hash -d nms=~/NMS/
hash -d crm=~/repos/avito-crm/
hash -d crmdir=/var/local/crm/
hash -d rec=~/repos/avito-recommendations/research
hash -d carrec=~/repos/avito-recommendations/research/cars_recommendations


export PYTHONPATH=/home/dkhodakov/repos/avito-crm/

# aliases
#pylint() pylint -rn --output-format=colorized "$@" | grep -v 'Locally disabling'


zssh() ssh "$@" -t zsh

CRMPATH=/var/local/crm/avito-crm
alias cdcrm="cd $CRMPATH"


# Avito files

export CRMSOURCE=/var/local/crm/avito-crm/
export CRMDATA=/var/local/crm/data/
export ARSPATH=~/repos/avito-recommendations/
export crmcred=slauncher@analytic-crm
alias crmssh="ssh slauncher@analytic-crm -t 'cd /var/local/crm/avito-crm/; bash'"
alias atrssh="ssh slauncher@avi-training01 -t 'bash'"
alias launchcrm="cd ~/repos/avito-crm/; ./bin/crm.server -m testing"
alias ripython="cd ~/repos/pynb; ipython notebook"

ODBCDIR=/var/local/dbconnect
export ODBCSYSINI=$ODBCDIR
export ODBCINI=$ODBCDIR/odbc.ini
export VERTICAINI=$ODBCDIR/odbc.ini

PATH=/home/dkhodakov/repos/avito-recommendations/service_manger:$PATH
export PATH
alias startvertica="sudo -u dbadmin /opt/vertica/bin/admintools -t start_db -d vert_test"
alias avito.backup="cd /home/ && tar -czf - ./dkhodakov | (pv -p --timer --rate --bytes > /media/dkhodakov/backup/avito_laptop/dkhodakov-$(date +"%Y.%d.%m-%H.%M").tgz); echo /media/dkhodakov/backup/avito_laptop/dkhodakov-$(date +"%Y.%d.%m-%H.%M").tgz"
