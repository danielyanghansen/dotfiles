#!/usr/bin/env zsh

# shellcheck source=utils.sh
source "$DOTFILES/install/utils.sh"
# shellcheck source=../zshrc
source "$DOTFILES/zshrc"

echo "Cloning and setting up dependencies"

# Load (install) plugins
for plugin in $plugins; do
  load_plugin "$plugin"
done

# Load (install) oh-my-zsh plugins
for plugin in $oh_my_zsh_plugins; do
  load_oh-my-zsh_plugin "$plugin"
done
