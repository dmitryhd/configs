# ------------------------------------------
# ZSH config
# ------------------------------------------
export ZSH=$HOME/.oh-my-zsh

# installed
# ZSH_THEME="bureau"
# custom
ZSH_THEME="pyzsh"

DISABLE_AUTO_UPDATE="false"
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# install autoenv
# git clone https://github.com/horosgrisa/autoenv ~/.oh-my-zsh/custom/plugins/autoenv
plugins=(git command-not-found dirhistory pip pylint python autopep8 dircycle docker httpie history pyenv redis-cli supervisor autoenv)

# kubectl completion zsh > ~/.kubectl-completion; helm completion zsh > ~/.helm-completion;
# wget https://raw.githubusercontent.com/zchee/go-zsh-completions/master/src/_minikube -O .minikube-completion
#source ~/.kubectl-completion
# source ~/.minikube-completion
#source ~/.helm-completion


# helm completion zsh

# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#autojump
# dircycle
# This is a small zle trick that lets you cycle your directory stack left or right using Ctrl+Shift+Left/Right. This is useful when moving back and forth between directories in development environments, and can be thought of as kind of a nondestructive pushd/popd.
# history
# Provides a couple of convenient aliases for using the history command to examine your command line history.

source $ZSH/oh-my-zsh.sh

# ------------------------------------------
# User config
# ------------------------------------------

PATH=$PATH:$HOME/.local/bin/
export PATH

export PYTHONDONTWRITEBYTECODE=1
export LANG=en_US.UTF-8

# Directory stack enable
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

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

alias h="history | tail -30"
alias ll="ls -lBcghX"

alias py='ipython3 --no-banner'
alias runipython='jupyter notebook --notebook-dir="~/repos/" --port=9999'
alias ll="ls -lvGh --group-directories-first"
alias htop='htop -d 3'
alias ra='ranger'
alias pya='pyenv activate'
alias pyy='pyenv activate ds; ipython3 --no-banner'

alias crmssh="ssh slauncher@analytic-crm -t 'cd /var/local/crm/avito-crm/; bash'"
alias ctrssh1="ssh -A slauncher@crm-training01 -t 'bash'"
alias ctrssh2="ssh -A slauncher@crm-training02 -t 'bash'"
alias ctrssh3="ssh -A slauncher@crm-training03 -t 'bash'"
alias ctrssh4="ssh -A slauncher@crm-training04 -t 'bash'"
alias ctrssh5="ssh -A slauncher@crm-training05 -t 'bash'"
alias gpussh1="ssh -A slauncher@rec-gpu01 -t 'bash'"

ODBCDIR=$HOME
export ODBCSYSINI=$ODBCDIR
export ODBCINI=$ODBCDIR/odbc.ini
export VERTICAINI=$ODBCDIR/odbc.ini

export EDITOR=vim
# export GOPATH=$HOME/go

# Python specific
# ------------------------------

ssh-add 2> /dev/null

#CUDA
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export CUDA_HOME=/usr/local/cuda-8.0

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
alias update-jupyter-extensions="pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master -U && \
        jupyter contrib nbextension install --user && \
        pip install jupyter_nbextensions_configurator -U && \
        jupyter nbextensions_configurator enable --user"

alias update-sci-py="pip3 install sklearn ipython numpy pandas xgboost theano tensorflow -U"

ds_recreate() {
    pyenv uninstall -f ds 
    pyenv virtualenv $1 ds
    pyenv activate ds
    pip3 install seaborn sklearn pandas numpy matplotlib keras tensorflow-gpu jupyter
}


alias ju='jupyter notebook --notebook-dir="~/repos/" --port=9999'

pyenv-path () {
    if [[ $# -ne 1 ]];
    then
        DIR=$(basename "$PWD")
    else
        DIR=$1
    fi
    echo "/home/dkhodakov/.pyenv/versions/$DIR/bin/python3"
}

alias cnd='export PATH="/home/dkhodakov/anaconda3/bin:$PATH"'

# Avito
# export PIP_INDEX_URL=http://pypi.k.avito.ru/pypi/
# export PIP_TRUSTED_HOST=pypi.k.avito.ru
