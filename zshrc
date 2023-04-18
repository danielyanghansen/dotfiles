# Run tmux if exists
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
  [ -z "${TMUX}" ] && exec tmux
else
  echo "tmux not installed on this system"
fi

# ---------------------------------------------------------
# Environment
# ---------------------------------------------------------
source $DOTFILES/.env
source $DOTFILES/.local/zshrc-template
# ---------------------------------------------------------
# Plugins
# ---------------------------------------------------------

# Source FZF if installed
# Manual
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
# Debian
elif [ -f /usr/share/doc/fzf/examples/completion.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
# Arch
elif [ -r /etc/arch-release ]; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
fi


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


# ---------------------------------------------------------
# Path
# ---------------------------------------------------------

export PATH="$HOME/.yarn/bin:$HOME/go/bin:/usr/local/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PASSWORD_STORE_DIR="/home/danielyh/code/webkomgit/password-store"

# ---------------------------------------------------------
# Environment
# ---------------------------------------------------------
export EDITOR='/usr/bin/nvim'
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# launch gpg-agent with ssh support
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# use ripgrep for fzf
# Respect gitignores and always ignore module directories
export FZF_DEFAULT_COMMAND="rg --files --follow --ignore-vcs -g '!{node_modules,venv}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ---------------------------------------------------------
# Prompt
# ---------------------------------------------------------

source $DOTFILES/prompt.zsh


# ---------------------------------------------------------
# Aliases
# ---------------------------------------------------------
source $DOTFILES/aliases.zsh


# ---------------------------------------------------------
# Functions
# ---------------------------------------------------------
source $DOTFILES/functions.zsh

