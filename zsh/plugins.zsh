#Plugins
source_plugin() {
  local source_file="$1.plugin.zsh"
  # Use second argument as filename if provided
  if [[ ! -z $2 ]]; then
    source_file=$2
  fi
  [[ -d $ZSH_PLUGINS/$1 ]] && source "$ZSH_PLUGINS/$1/$source_file"
}

# Place github path for plugins to be installed here.
plugins=(
  "zsh-users/zsh-autosuggestions"
  "zsh-users/zsh-syntax-highlighting"
  "zsh-users/zsh-completions"
  "zsh-users/zsh-history-substring-search"
)


# Oh-my-zsh plugins to be installed, can be found in ~/.oh-my-zsh/plugins
oh_my_zsh_plugins=(
  "sudo"
  "dotenv"
  "git"
)

source_plugin zsh-autosuggestions
source_plugin zsh-syntax-highlighting
source_plugin zsh-completions
source_plugin zsh-history-substring-search
source_plugin sudo
source_plugin dotenv
