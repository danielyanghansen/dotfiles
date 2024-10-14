#!/usr/bin/env bash

# shellcheck source=utils.sh
source "$DOTFILES/install/utils.sh"

# check if tmux is intalled
check_install tmux -e

backup_file "$HOME/.tmux.conf"

echo "source $DOTFILES/tmux.conf" >"$HOME/.tmux.conf"

echo "Installing tmux plugin manager"

# Define TPM path
TPM_DIR="$HOME/.tmux/plugins/tpm"

# Check if TPM is already installed
if [ -d "$TPM_DIR" ]; then
    echo "TPM is already installed. Pulling the latest updates..."
    # Navigate to TPM directory and pull the latest changes
    git -C "$TPM_DIR" pull
else
    echo "TPM is not installed. Cloning TPM..."
    git clone git@github.com:tmux-plugins/tpm.git "$TPM_DIR"
fi

echo -e "\nInstalling tmux - DONE\n"
