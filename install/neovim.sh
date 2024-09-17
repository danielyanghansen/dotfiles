#!/usr/bin/env bash

# shellcheck source=utils.sh
source "$DOTFILES/install/utils.sh"

# check if vim is intalled
check_install nvim -e

NVIMDIR="$HOME/.config/nvim"

if [[ ! -d $NVIMDIR ]]; then
      mkdir "$NVIMDIR"
    fi

backup_file "$NVIMDIR/init.vim"

echo "source $DOTFILES/init.vim" >"$NVIMDIR/init.vim"

echo -e "\nInstalling neovim config - DONE\n"
