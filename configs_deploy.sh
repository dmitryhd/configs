#!/bin/bash

copy_command="cp -ir"
copy_command_v="cp -vr"
echo $1
if [[ $1 -eq '-f' ]]
then
  copy_command="cp -r"
fi

git pull
$copy_command_v .bashrc ~/
$copy_command_v .gitconfig ~/ 
$copy_command_v .vimrc ~/
$copy_command_v .zshrc ~/
$copy_command_v dmitryhd.zsh-theme ~/.oh-my-zsh/themes/dmitryhd.zsh-theme
$copy_command .vim/ ~/
$copy_command awesome ~/.config/
$copy_command_v .conkyrc ~/
