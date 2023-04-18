<p align="center">
  <h1 align="center" style="text-decoration: underline;">danielyanghansen dotfiles</h1>
</p>

**Dotfiles used on (currently) Debian Linux for the following:**
- [Vim](http://vim.org)
- [zsh](http://zsh.sourceforge.net)
- [tmux](https://github.com/tmux/tmux)

## Installation

> Make sure to install Nerdfonts: https://github.com/ryanoasis/nerd-fonts

The configration uses an install utility, run the utility to see what can be auto-installed.

```sh
chmod +x install.sh
./install.sh
```


To Install everything automatically, run the install utility with `-a`:

```sh
./install.sh -a
```

## Tmux

`./install.sh tmux` to install.

## ZSH

#### Fzf

- Both zsh and vim configration uses fzf.
- Note: fzf commands in zsh uses ripgrep instead of grep for optimal performance.
  use the utility to install it as well.

- Installation

```sh
./install.sh cli-tools -n fzf
./install.sh cli-tools -n ripgrep
```

#### Installation

Install with the provided utility with `zsh` as argument:

> This only installs the configuration

```sh
./install.sh zsh
```

#### Updating

To update zsh plugins, run:

```sh
./install.sh zsh-update # in dotfiles folder
# Or
dots zsh-update # From anywhere
```

This will also install any new plugins defined in `zshrc`

> Currently does not support updates from oh-my-zsh plugins


## Gnome configuration

Make sure to have gnome-tweaks installed and run:

```sh
cd ~
dconf load / < dotfiles/ubuntu/saved_settings.dconf
```
