# Run tmux if exists
run_tmux() {
  if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
    [ -z "${TMUX}" ] && exec tmux
  else
    echo "tmux not installed on this system"
  fi
}

if [[ "${DOTFILES_DISABLE_AUTO_TMUX:-0}" != "1" ]]; then
  run_tmux
fi

# ---------------------------------------------------------
# Environment
# ---------------------------------------------------------
[[ -f "$DOTFILES/.env" ]] && source "$DOTFILES/.env"
[[ -f "$DOTFILES/.env.local" ]] && source "$DOTFILES/.env.local"
[[ -f "$DOTFILES/.local/zshrc-template" ]] && source "$DOTFILES/.local/zshrc-template"
# ---------------------------------------------------------
# Plugins
# ---------------------------------------------------------
source "$DOTFILES/zsh/plugins.zsh"

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
export PATH="/usr/local/NVIDIA-Nsight-Compute:$PATH"

export PASSWORD_STORE_DIR="${PASSWORD_STORE_DIR:-$HOME/code/webkomgit/password-store}"

# ---------------------------------------------------------
# Environment
# ---------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"

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

# Override Ctrl+T behavior to use fzf_with_preview
export FZF_CTRL_T_OPTS="--preview 'batcat --color=always --style=numbers --line-range=:500 {}'"

# pyenv: optional Python version manager. Safe to leave installed per-machine.
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# zoxide: smarter `cd` history. Installed by `./install.sh cli-tools -n zoxide`.
# Use `z foo` to jump to a frequently used directory matching "foo".
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi


# ---------------------------------------------------------
# Prompt
# ---------------------------------------------------------
source "$DOTFILES/zsh/prompt.zsh"


# ---------------------------------------------------------
# Aliases
# ---------------------------------------------------------
source "$DOTFILES/zsh/aliases.zsh"


# ---------------------------------------------------------
# Functions
# ---------------------------------------------------------
source "$DOTFILES/zsh/functions.zsh"

# ---------------------------------------------------------
# SSH Key Agent
# ---------------------------------------------------------
source "$DOTFILES/zsh/agents.zsh"
