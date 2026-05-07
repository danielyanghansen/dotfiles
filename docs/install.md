# Installation

Run the installer from the repo root:

```sh
./install.sh
```

Install everything:

```sh
./install.sh -a
```

Install one area:

```sh
./install.sh zsh
./install.sh tmux
./install.sh vim
./install.sh neovim
./install.sh cli-tools -n fzf
```

## Flow

```mermaid
flowchart TD
  start["./install.sh <target>"] --> constants["write .local/constants"]
  constants --> target{"target"}
  target --> zsh["install/zsh.sh"]
  target --> tmux["install/tmux.sh"]
  target --> vim["install/vim.sh"]
  target --> nvim["install/neovim.sh"]
  target --> cli["install/cli-tools.sh"]

  zsh --> homezsh["~/.zshrc -> source .local/zsh"]
  homezsh --> localzsh[".local/zsh -> constants + zshrc"]
  zsh --> plugins["install/zsh_plugins.sh"]

  tmux --> hometmux["~/.tmux.conf -> source tmux.conf"]
  vim --> homevim["~/.vimrc -> source vimrc"]
  nvim --> homenvim["~/.config/nvim/init.vim -> source init.vim"]
```

## What Installers Do

- Back up existing home config files into `.local/backup/`.
- Create small home-directory shim files that source repo configs.
- Install or update zsh/tmux plugins where configured.
- Install selected CLI tools through a package manager when requested.

The installers are intentionally thin. Most behavior lives in the config files
they point to.

Update this page when a new install target is added or a shim path changes.
