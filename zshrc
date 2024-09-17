# Run tmux if exists
run_tmux() {
  if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
    [ -z "${TMUX}" ] && exec tmux
  else
    echo "tmux not installed on this system"
  fi
}

run_tmux # Seems to create issues with warp

# ---------------------------------------------------------
# Environment
# ---------------------------------------------------------
source $DOTFILES/.env
source $DOTFILES/.local/zshrc-template
# ---------------------------------------------------------
# Plugins
# ---------------------------------------------------------
source $DOTFILES/zsh/plugins.zsh

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




# ---------------------------------------------------------
# Path
# ---------------------------------------------------------

export PATH="$HOME/.yarn/bin:$HOME/go/bin:/usr/local/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PASSWORD_STORE_DIR="$HOME/code/webkomgit/password-store"

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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# ---------------------------------------------------------
# Prompt
# ---------------------------------------------------------
source $DOTFILES/zsh/prompt.zsh


# ---------------------------------------------------------
# Aliases
# ---------------------------------------------------------
source $DOTFILES/zsh/aliases.zsh


# ---------------------------------------------------------
# Functions
# ---------------------------------------------------------
source $DOTFILES/zsh/functions.zsh

# ---------------------------------------------------------
# SSH Key Agent
# ---------------------------------------------------------
source $DOTFILES/zsh/agents.zsh
