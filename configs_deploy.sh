#!/bin/bash

copy_command="cp -ivr"
echo $1
if [[ $1 -eq '-f' ]]
then
  copy_command="cp -vr"
fi

$copy_command .bashrc ~/
$copy_command dimert2.zsh-theme ~/.oh-my-zsh/themes/dimert2.zsh-theme
$copy_command .gitconfig ~/ 
$copy_command .vimrc ~/
$copy_command .vimrc_functions ~/
$copy_command .zshrc ~/
$copy_command .vim/ ~/
