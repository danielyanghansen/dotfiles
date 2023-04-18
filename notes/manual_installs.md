# Neovim
Install normally with apt

## vim-plug for neovim
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Plugins should all end up in `~/.local/share`

### CoC Conquerors of Completion
To get started, navigate to `~/.local/share/nvim/plugged/coc.nvim` and run `yarn` or `yarn install` 

## Dependencies
`exuberant-ctags`

# LSD
https://github.com/lsd-rs/lsd


# Other stuff
Neofetch
Batcat



# Lazigit:
https://github.com/jesseduffield/lazygit
## Ubuntu
```sh
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

```
