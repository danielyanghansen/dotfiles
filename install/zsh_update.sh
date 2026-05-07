#!/usr/bin/env zsh

source "$DOTFILES/install/utils.sh"
source "$DOTFILES/zsh/plugins.config.zsh"

print_help() {
  printf "Usage: install.sh zsh-update [options]\n"
  printf "\tOptions:\n"
  printf "\t%s\t%s\n" \
    "-f|--force" "Force install missing plugins" \
    "-l|--list" "List all configured zsh plugins"
}

print_all() {
  printf "GitHub zsh plugins:\n"
  for plugin in ${plugins[@]}; do
    printf "\t%s\n" "$plugin"
  done

  printf "Oh My Zsh plugins:\n"
  for plugin in ${oh_my_zsh_plugins[@]}; do
    printf "\t%s\n" "$plugin"
  done
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
    exit 0
    ;;
  -l | --list)
    print_all
    exit 0
    ;;
  *)
    shift
    ;;
  esac
done

ZSH_PLUGINS="${ZSH_PLUGINS:-$DOTFILES/.local/zsh_plugins}"
mkdir -p "$ZSH_PLUGINS"

if [[ -n "$(print -r -- "$ZSH_PLUGINS"/*(N))" ]]; then
  for dir in "$ZSH_PLUGINS"/*(N/); do
    update_plugin "$(basename "$dir")"
  done
fi

# Check for new plugins and install
for plugin in ${plugins[@]}; do
  plugin_name="$(echo "$plugin" | awk '{split($0,a,"/"); print a[2]}')"
  if [[ ! -d "$ZSH_PLUGINS/$plugin_name" ]]; then
    echo -e "\e[0m Found plugin: \e[1m$plugin_name\e[0m, which is not installed."
    echo -e "\e[0m Do you wish to install it? [Y/n].\c"
    read -r option
    if [[ $option == '' || $option == 'y' ]]; then
      load_plugin "$plugin"
    fi
  fi
done

for plugin in ${oh_my_zsh_plugins[@]}; do
  if [[ ! -d "$ZSH_PLUGINS/$plugin" ]]; then
    echo -e "\e[0m Found plugin: \e[1m$plugin\e[0m, which is not installed."
    echo -e "\e[0m Do you wish to install it? [Y/n].\c"
    read -r option
    if [[ $option == '' || $option == 'y' ]]; then
      load_oh-my-zsh_plugin "$plugin"
    fi
  fi
done
