#!/usr/bin/env bash

# shellcheck source=utils.sh
source "$DOTFILES/install/utils.sh"

# check if tmux is intalled
check_install tmux -e

backup_file "$HOME/.tmux.conf"

echo "source $DOTFILES/tmux.conf" >"$HOME/.tmux.conf"

echo "Installing tmux plugin manager"
git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm

echo -e "\nInstalling tmux - DONE\n"
