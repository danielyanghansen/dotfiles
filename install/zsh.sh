#!/usr/bin/env bash

# shellcheck source=utils.sh
source "$DOTFILES/install/utils.sh"

check_install zsh -e

echo "Changing login shell to zsh..."
chsh $USER -s "$(which zsh)"

# Set zsh plugin directory
ZSH_PLUGINS=$DOTFILES/.local/zsh_plugins

backup_file "${ZDOTDIR:-$HOME}/.zshrc"
backup_file "${ZDOTDIR:-$HOME}/.zshenv"

#Source zshrc from home folder
echo "source $DOTFILES/.local/zsh" >"${ZDOTDIR:-$HOME}/.zshrc"

echo "source $DOTFILES/.local/constants" >"$DOTFILES/.local/zsh"
echo "export ZSH_PLUGINS=$ZSH_PLUGINS" >>"$DOTFILES/.local/zsh"
echo "source $DOTFILES/zshrc" >>"$DOTFILES/.local/zsh"

# Create directory to source completions
mkdir -p "$DOTFILES/.local/completions"

# Source zshenv config from home folder
echo "source $DOTFILES/zshenv" >"${ZDOTDIR:-$HOME}/.zshenv"

chmod +x "$DOTFILES/install/zsh_plugins.sh"
"$DOTFILES/install/zsh_plugins.sh"

echo -e "\nInstalling zsh - DONE\n"
