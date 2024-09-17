#!/bin/bash

# load plugins from github
# syntax: load_plugin "zsh-users/syntax-highlighting"
load_plugin() {

  local plugin_name
  plugin_name="$(echo "$1" | awk '{split($0,a,"/"); print a[2]}')"
  if [[ ! -d "$ZSH_PLUGINS/$plugin_name" ]]; then
    echo -e "\e[1mInstalling $1...              \c"
    git clone "https://github.com/$1.git" "$ZSH_PLUGINS/$plugin_name"
    echo -e "\e[1;94mDONE\e[0m"
  else
    echo -e "\e[1m$1\e[0m is already installed."
  fi

}

# Load plugins from oh-my-zsh
# Syntax: load_oh-my-zsh_plugin "sudo"
# **Requires svn to be installed**
load_oh-my-zsh_plugin() {

  check_install "svn"
  if [[ ! -d "$ZSH_PLUGINS/$1" ]]; then
    echo -e "\e[1mInstalling $1...              \c"
    svn export --quiet "https://github.com/robbyrussell/oh-my-zsh/trunk/plugins/$1" "$ZSH_PLUGINS/$1"
    echo -e "\e[1;94mDONE\e[0m"
  else
    echo -e "\e[1m$1\e[0m is already installed."
  fi

}

# Update plugins
update_plugin() {
  local plugin_name="$1"
  if [[ -d "$ZSH_PLUGINS/$plugin_name" ]]; then
    echo -e "\e[1mLooking for changes in $1\e[0m"
    git -C "$ZSH_PLUGINS/$plugin_name" remote update -p >>/dev/null
    _local="$(git -C "$ZSH_PLUGINS/$plugin_name" rev-parse HEAD 2>/dev/null)"
    _remote="$(git -C "$ZSH_PLUGINS/$plugin_name" rev-parse '@{u}' 2>/dev/null)"
    if [[ "$_local" != "$_remote" ]]; then
      echo -e "Fetching updates...    \c"
      git -C "$ZSH_PLUGINS/$plugin_name" merge --ff-only '@{u}' >>/dev/null
    else
      echo -e "$1 is already up to date... \c"
    fi
    echo -e "\e[1;94mDONE\e[0m"
  fi

}

# Create a backup of a file in the "$DOTFILES/.local/backup" directory
# Syntax: backup_file "path-to-file"
backup_file() {

  if [[ -e $1 ]]; then

    if [[ ! -d $DOTFILES/.local/backup ]]; then
      mkdir "$DOTFILES/.local/backup"
    fi

    local filename
    filename=$(basename "$1")

    cp "$1" "$DOTFILES/.local/backup/$filename"

    echo "Created a backup of '$1' in: $DOTFILES/.local/backup/$filename"

  fi
}

# Check for installed program and install when confirmed
# Optional second argument -e for exiting 0 if not installed
# Syntax: check_install "<program>" "-e"
check_install() {
  if [[ ! $(command -v "$1") ]]; then
    echo -e "\e[1m$1\e[0m is not installed."
    echo -e "\e[0m Do you wish to install it? [Y/n].\c"
    read -r option
    if [[ "$option" == "" || "$option" == "y" ]]; then
      "$DOTFILES/install/cli_tools.sh" -n "$1"
    else
      if [[ $2 == "-e" ]]; then
        exit 1
      fi
    fi
  fi
}
