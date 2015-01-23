#!/bin/bash

copy_command="cp -r"
copy_command_v="cp -vr"

$copy_command_v ~/.bashrc .
$copy_command_v ~/.gitconfig .
$copy_command_v ~/.vimrc .
$copy_command_v ~/.zshrc .
$copy_command_v ~/.oh-my-zsh/themes/dmitryhd.zsh-theme .
$copy_command ~/.vim/ .
$copy_command ~/.config/awesome .
$copy_command_v ~/.conkyrc .
$copy_command_v ~/.gitignore .
$copy_command_v ~/.gitconfig . 
