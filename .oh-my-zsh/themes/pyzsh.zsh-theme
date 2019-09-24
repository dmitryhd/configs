# oh-my-zsh Bureau Theme
# - git
# - python

# Theme color
# THCOL="%{$fg_bold[green]%}"
THCOL="%{$fg[green]%}"
# THCOLNB="%{$fg[green]%}"
THCOL2="%{$fg_bold[yellow]%}"
THBOLD="%{$fg_bold[white]%}"
NC="%{$reset_color%}"

# Brackets ⦗, ⦘, ❲❳, ⎜,⎟
# https://stackoverflow.com/questions/13535172/list-of-all-unicodes-open-close-brackets
# OBR="${THCOL}⎜$NC"
# CBR="${THCOL}⎟$NC"
# or disable
OBR="${THCOL} $NC"
CBR="${THCOL} $NC"
# SPACECH="━"
SPACECH="─"

### Git [±master ▾●]⎇

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}.%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}.%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}.%{$reset_color%}"

bureau_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

bureau_git_status () {
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  _STATUS=""
  if $(echo "$_INDEX" | grep '^[AMRD]. ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi
  if $(echo "$_INDEX" | grep '^.[MTD] ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi
  if $(echo "$_INDEX" | grep -E '^\?\? ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi
  if $(echo "$_INDEX" | grep '^UU ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi
  if $(echo "$_INDEX" | grep '^## .*ahead' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | grep '^## .*behind' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | grep '^## .*diverged' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi

  echo $_STATUS
}

bureau_git_prompt () {
  local _branch=$(bureau_git_branch)
  local _status=$(bureau_git_status)
  local _result=""
  if [[ "${_branch}x" != "x" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch"
    if [[ "${_status}x" != "x" ]]; then
      _result="${THCOL2}git $NC$_status $_result"
    fi
    _result="$_result$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo $_result
}

_PATH="$NC%~$NC"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY=""
else
  _USERNAME="%{$fg_bold[green]%}%n%{$reset_color%}"
  _LIBERTY=""
fi
_USERNAME="$_USERNAME%{$fg_bold[white]%}@%{$fg_bold[yellow]%}%m%}$reset_color%}"  # @%{$fg_bold[yellow]%}%m%{
_LIBERTY="$_LIBERTY%{$reset_color%}%"

get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES="$THCOL"
  (( LENGTH = ${COLUMNS} - $LENGTH - 1))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES$SPACECH"
    done

  echo "$SPACES%{$reset_color%}"
}

get_python_version () {
    if [ -n "$VIRTUAL_ENV" ]
    then
      # Visual glyph
      # echo "$OBR${THCOL}🐍:$NC($THBOLD$(echo $VIRTUAL_ENV | awk -F '/' '{print $NF}')$NC)$CBR"
      echo "${THCOL} $SPACECH$SPACECH$SPACECH py:$NC($THBOLD$(echo $VIRTUAL_ENV | awk -F '/' '{print $NF}')$NC)"
    fi
}


bureau_precmd () {
  _1LEFT="$THCOL╭$SPACECH$OBR$_PATH%{$reset_color%}$CBR"
  # GIT + time on top right corner
  _1RIGHT="$OBR$(bureau_git_prompt)$THCOL$NC$(get_python_version)"
  _1SPACES=`get_space $_1LEFT $_1RIGHT`
  print
  print -rP "$_1LEFT$_1SPACES$_1RIGHT"
}

setopt prompt_subst
PROMPT='$THCOL╰$SPACECH→$NC $_LIBERTY '
RPROMPT=''

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
