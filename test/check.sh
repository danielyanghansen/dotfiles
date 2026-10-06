#!/usr/bin/env bash
set -euo pipefail

# One command for repo sanity checks.
# Keep this small: it should catch broken shell syntax and installer help/listing
# regressions without changing the machine.

cd "$(dirname "$0")/.."

bash_files=(
  test/check.sh
  install.sh
  install/cli-tools.sh
  install/neovim.sh
  install/tmux.sh
  install/utils.sh
  install/vim.sh
  install/zsh.sh
  spotify_info.sh
)

zsh_files=(
  zshrc
  zshenv
  install/zsh_plugins.sh
  install/zsh_update.sh
  zsh/agents.zsh
  zsh/aliases.zsh
  zsh/functions.zsh
  zsh/plugins.config.zsh
  zsh/plugins.zsh
  zsh/prompt.zsh
)

if command -v shellcheck >/dev/null 2>&1; then
  shellcheck -e SC1091 "${bash_files[@]}"
else
  printf 'warning: shellcheck not installed; running bash -n only\n' >&2
fi

for file in "${bash_files[@]}"; do
  bash -n "$file"
done

if command -v zsh >/dev/null 2>&1; then
  for file in "${zsh_files[@]}"; do
    zsh -n "$file"
  done
else
  printf 'warning: zsh not installed; skipping zsh -n checks\n' >&2
fi

./install.sh >/dev/null
./install.sh cli-tools --list >/dev/null
./install.sh cli-tools --list-managers >/dev/null

printf 'checks passed\n'
