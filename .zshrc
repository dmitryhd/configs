export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dmitryhd"

DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"

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

alias h="history | tail -30"
# 
alias confchange="cd ~conf && ./configs_upload.sh && git commit -a -m 'changed' && git push && git push github master && cd ~1"

alias zsh-reload="source ~/.zshrc"

hash -d nms=~/NMS/
hash -d usb=/media/usb01
hash -d data=/media/data_drive/
hash -d conf=~/repos/configs/
hash -d vac=~/repos/vacancy_analysis

export PYTHONPATH=/home/dimert/NMS/nms_app:/home/dimert/NMS/

# aliases
#pylint() pylint -rn --output-format=colorized "$@" | grep -v 'Locally disabling'


zssh() ssh "$@" -t zsh
