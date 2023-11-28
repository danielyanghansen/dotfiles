# Set dotfiles directory
DOTFILES="$(pwd)"

# Create a directory for local files
if [[ ! -d $DOTFILES/.local ]]; then
  mkdir "$DOTFILES/.local"
fi

# Create a seperate file for global constants to not reset any local file used by
# another installation.
echo "export DOTFILES=$DOTFILES" >"$DOTFILES/.local/constants"
# shellcheck source=.local/constants
source "$DOTFILES/.local/constants"

# Declare a table of install scripts
declare -A install_scripts=(
  ["zsh"]="$DOTFILES/install/zsh.sh"
  ["zsh-update"]="$DOTFILES/install/zsh_update.sh"
  ["vim"]="$DOTFILES/install/vim.sh"
#  ["tmux"]="$DOTFILES/install/tmux.sh"
  ["cli-tools"]="$DOTFILES/install/cli-tools.sh"
)

# Options for running the script automatically
declare -A install_scripts_opts=(
  ["cli-tools"]="-a"
)

# Run provided install scripts
if [[ -n $1 && -n "${install_scripts["$1"]}" ]]; then
  echo -e "\e[1mStarting $1 installation process...\e[0m\n"
  chmod +x "${install_scripts["$1"]}"
  ${install_scripts["$1"]} "$@"
# Run all scripts on -a or --all
elif [[ $1 == "-a" || $1 == "--all" ]]; then
  for script in "${!install_scripts[@]}"; do
    chmod +x "${install_scripts["$script"]}"
    # Run the script, with options declared in $install_scripts_opts
    ${install_scripts["$script"]} "${install_scripts_opts["$script"]}"
  done
else
  # Output a help message if no args are provided
  echo "Usage: $0 [program]
  where [program] is one of the following:"
  for i in "${!install_scripts[@]}"; do
    printf "\t%s\n" "$i"
  done
  printf "\t-a|--all\tRun all install scripts (Install everything)\n"
fi
