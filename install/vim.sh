#!/usr/bin/env bash

# shellcheck source=utils.sh
source "$DOTFILES/install/utils.sh"

# check if vim is intalled
check_install vim -e

backup_file "$HOME/.vimrc"

echo "source $DOTFILES/vimrc" >"$HOME/.vimrc"

echo -e "\nInstalling vim - DONE\n"
