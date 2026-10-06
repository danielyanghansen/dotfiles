# Maintenance

This page is the checklist for keeping the repo understandable as it changes.

## Before Changing Behavior

```sh
git status --short
```

Know whether you are changing source files, generated files, or local/private
state.

## Add A CLI Tool

Edit `install/cli-tools.sh` and add the package name plus command:

```bash
["ripgrep"]="rg"
```

Then test the listing:

```sh
./install.sh cli-tools --list
```

## Add A Zsh Plugin

Edit `zsh/plugins.config.zsh`:

```zsh
plugins=(
  "zsh-users/zsh-autosuggestions"
  "owner/plugin-name"
)
```

Then update plugins:

```sh
./install.sh zsh-update
```

## Add Local Environment

Use `.env.local` for values that differ between machines:

```sh
export WEBKOMCODE="$HOME/code/webkomgit"
export DOTFILES_DISABLE_AUTO_TMUX=1
```

Add reusable examples to `.env.example`, not private values.

## Update Documentation

When a config file changes, update the matching manual page in `docs/`.
When install flow changes, update `docs/install.md`.
When files move, update `docs/structure.md`.

## Sanity Checks

Run the maintained check script:

```sh
bash test/check.sh
git status --short
```

What it covers:

- `shellcheck` for bash scripts, when ShellCheck is installed.
- `bash -n` for bash syntax.
- `zsh -n` for zsh syntax, when zsh is installed.
- Installer help/list commands that should not change the machine.

The equivalent manual commands are:

```sh
shellcheck -e SC1091 install.sh install/cli-tools.sh install/neovim.sh install/tmux.sh install/utils.sh install/vim.sh install/zsh.sh spotify_info.sh
./install.sh
./install.sh cli-tools --list
./install.sh cli-tools --list-managers
```

Update this page when a repeated maintenance task appears more than once.
