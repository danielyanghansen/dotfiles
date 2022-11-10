#!/usr/bin/env zsh

source $DOTFILES/install/utils.sh
source $DOTFILES/zshrc

print_help() {
  printf "Usage: install.sh zsh-update [options]\n"
  printf "\tOptions:\n"
  n
  printf "\t%s\t%s\n" \
    "-f|--force" "Force intstall missing plugins" \
    "-l|--list" "List all zsh plugins with status (Not implemented)"
}

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
  -f | --force)
    force=true
    shift
    ;;
  -h | --help)
    print_help
    exit 1
    ;;
  -l | --list)
    print_all
    exit 1
    ;;
  *)
    shift
    ;;
  esac
done

mkdir -p "$ZSH_PLUGINS"

for dir in $ZSH_PLUGINS/*; do
  update_plugin "$(basename "$dir")"
done

# Check for new plugins and install
for plugin in ${plugins[@]}; do
  local plugin_name="$(echo $plugin | awk '{split($0,a,"/"); print a[2]}')"
  if [[ ! -d $ZSH_PLUGINS/$plugin_name ]]; then
    echo -e "\e[0m Found plugin: \e[1m$plugin_name\e[0m, which is not installed."
    echo -e "\e[0m Do you wish to install it? [Y/n].\c"
    read option
    if [[ $option == '' || $option == 'y' ]]; then
      load_plugin $plugin
    fi
  fi
done

for plugin in ${oh_my_zsh_plugins[@]}; do
  if [[ ! -d $ZSH_PLUGINS/$plugin ]]; then
    echo -e "\e[0m Found plugin: \e[1m$plugin\e[0m, which is not installed."
    echo -e "\e[0m Do you wish to install it? [Y/n].\c"
    read option
    if [[ $option == '' || $option == 'y' ]]; then
      load_oh-my-zsh_plugin $plugin
    fi
  fi
done
