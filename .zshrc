# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
zstyle :compinstall filename '/home/dimert/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
unsetopt beep
bindkey -v

# End of lines configured by zsh-newuser-install

autoload -U promptinit && promptinit
prompt adam2

# aliases
alias ll='ls -lah'
alias gitlog='git log -10 --pretty=format:"%h - %an, %ar : %s" --graph'
alias ls='ls --color=auto'
alias grep='grep --color=always'
