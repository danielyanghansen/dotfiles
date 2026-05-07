# danielyanghansen dotfiles

Personal dotfiles for zsh, tmux, Vim, and Neovim on Linux.

Start with the manual:

- [Overview](docs/index.md)
- [Repo structure](docs/structure.md)
- [Installation](docs/install.md)
- [Zsh](docs/zsh.md)
- [Tmux](docs/tmux.md)
- [Vim and Neovim](docs/vim.md)
- [Maintenance](docs/maintenance.md)

## Quick Start

```sh
chmod +x install.sh
./install.sh
```

Install everything the installer knows about:

```sh
./install.sh -a
```

Install one area:

```sh
./install.sh zsh
./install.sh tmux
./install.sh neovim
```

Machine-specific environment values belong in `.env.local`. Use
[.env.example](.env.example) as the template.
