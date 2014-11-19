#!/bin/bash

copy_command="cp -vr"

$copy_command ~/.bashrc .
$copy_command ~/.gitconfig .
$copy_command ~/.vimrc .
$copy_command ~/.vimrc_functions .
$copy_command ~/.zshrc .
$copy_command ~/.oh-my-zsh/themes/dimert2.zsh-theme .
$copy_command ~/.config/awesome ./awesome
$copy_command ~/.vim/ .
