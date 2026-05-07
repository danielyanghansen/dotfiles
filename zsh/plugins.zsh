# Plugins
source "$DOTFILES/zsh/plugins.config.zsh"
ZSH_PLUGINS="${ZSH_PLUGINS:-$DOTFILES/.local/zsh_plugins}"

source_plugin() {
  local source_file="$1.plugin.zsh"
  # Use second argument as filename if provided
  if [[ -n $2 ]]; then
    source_file=$2
  fi
  [[ -d $ZSH_PLUGINS/$1 ]] && source "$ZSH_PLUGINS/$1/$source_file"
}

source_plugin zsh-autosuggestions
source_plugin zsh-syntax-highlighting
source_plugin zsh-completions
source_plugin zsh-history-substring-search
source_plugin sudo
source_plugin dotenv
source_plugin git
