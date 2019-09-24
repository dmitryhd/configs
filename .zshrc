export ZSH=$HOME/.oh-my-zsh

HISTSIZE=1000
SAVEHIST=1000

# ZSH_THEME="bureau"
ZSH_THEME="pyzsh"
#ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
    git 
    pip 
    python 
    docker 
    httpie 
    history 
    pyenv 
    redis-cli 
    autoenv
    golang
)

# install autoenv
# git clone https://github.com/horosgrisa/autoenv ~/.oh-my-zsh/custom/plugins/autoenv
# source ~/.kubectl-completion
# source ~/.minikube-completion

source $ZSH/oh-my-zsh.sh

PATH=$PATH:$HOME/.local/bin/:/usr/local/go/bin
export PATH

export LANG=en_US.UTF-8

alias ll="ls -lvh"
alias htop='htop -d 3'

export EDITOR=vim

# Short history 
hg() {
    # zsh only
    if [[ "$#" == 1 ]]
    then
        fc -l 1 | grep -i $1
    elif [[ "$#" == 2 ]]
    then
        fc -l 1 | grep -i "$1.*$2"
    else
        fc -l -40
    fi
}

# Python configs
# ----------------------------------------

export PYTHONDONTWRITEBYTECODE=1
alias py='ipython3 --no-banner'
alias pyy='pyenv activate ds; ipython3 --no-banner'
alias py-update='pip3 install -r requirements.txt -r test-requirements.txt -r dev-requirements.txt pip -U'

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv-path () {
    if [[ $# -ne 1 ]];
    then
        DIR=$(basename "$PWD")
    else
        DIR=$1
    fi
    echo "$(pyenv root)/versions/$DIR/bin/python3"
}

# Golang
# ----------------------------------
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias dh='dirs -v'
alias gvimr="gvim --remote-tab"
# GIT alias
alias gitst="git diff --stat"
alias gitdi="git diff"
alias gitci="git commit -a "
alias gitcim="git commit -a -m"
alias gitco="git checkout "
alias gitlo="git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short -40"
alias gitbr="git branch -v"
alias gith='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias gittags='git tag -n'
alias gitd='git diff'
alias gitdel='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

ssh-add 2> /dev/null

