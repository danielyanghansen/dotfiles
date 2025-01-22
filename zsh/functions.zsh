# dots
# Run the dotfiles script from anywhere
  dots() {
    cd "$DOTFILES" && bash ./install.sh $@
    cd - >>/dev/null
  }


# Read MarkDown
rmd() {
  pandoc $1 | lynx -stdin
}

# Search and install from apt with fzf
# Optional argument to shorten search list
asp() {
  local inst=$(apt-cache search "${1:-.}" | eval "fzf -m --header='[apt install]'")
  if [[ $inst ]]; then
    local name=$(echo $inst | head -n1 | awk '{print $1;}')
    if [[ ! -z "$(apt list --installed 2>/dev/null | grep -e "^$name/")" ]]; then
      echo -e "\e[1m$name\e[0m is alredy installed: (u)pdate or (r)emove [ENTER to cancel]: \c"
      read option
      if [[ $option == "u" || $option == "U" ]]; then
        echo -e "\e[1mUpgrading: \e[1;94m$inst\e[0m \n"
        sudo apt install $name
      elif [[ $option == "r" || $option == "R" ]]; then
        echo -e "\e[1mRemoving: \e[1;94m$inst\e[0m \n"
        sudo apt remove $name
      fi
    else
      echo -e "\e[1mInstalling: \e[1;94m$inst\e[0m \n"
      sudo apt install $name
    fi
  fi
}

# GitHub
ghc() {
  # Original author: Sebastian Jambor (https://github.com/sgrj)
  # Original source retrieved from: https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/

  local jq_template pr_number

  jq_template='"'\
  '#\(.number) - \(.title)'\
  '\t'\
  'Author: \(.user.login)\n'\
  'Created: \(.created_at)\n'\
  'Updated: \(.updated_at)\n\n'\
  '\(.body)'\
  '"'

  if [ -n "$1" ]; then
    pr_number="$1"
  else
    pr_number="$(
    gh api 'repos/:owner/:repo/pulls' |
      jq ".[] | $jq_template" |
      sed -e 's/"\(.*\)"/\1/' -e 's/\\t/\t/' |
      fzf \
      --with-nth=1 \
      --delimiter='\t' \
      --preview='echo -e {2}' \
      --preview-window=top:wrap |
      sed 's/^#\([0-9]\+\).*/\1/'
    )"
  fi

  if [ -n "$pr_number" ]; then
    gh pr checkout "$pr_number"
  fi
}

# FZF search for ssh

s() {
  if [ $# -eq 1 ]; then
    # If an argument is provided, use it as the host and SSH to it
    ssh "$1"
  else
    local selected_host

    # Use fzf to interactively select a host from your .ssh/config
    selected_host=$(grep -E '^Host ' ~/.ssh/config | awk '{print $2}' | fzf)

    # Check if a host was selected
    if [ -n "$selected_host" ]; then
      # SSH to the selected host
      ssh "$selected_host"
    else
      echo "No host selected."
    fi
  fi
}


# FZF - Currently unused
function fzf_with_preview() {
    local FZF_PREVIEW_COMMAND='
        if [[ ! -e {} ]]; then echo "File does not exist."; return; fi; 
        if [[ ! -s {} ]]; then echo "File is empty :/"; return; fi; 
        batcat --color=always --style=numbers --line-range=:500 {}'
    fzf --preview="$FZF_PREVIEW_COMMAND" "$@"
}
# !!!Requires batcat

function slowwrite() {
  # Check if input is provided
  if [[ $# -eq 0 ]]; then
    echo "Usage: slowwrite <string>"
    return 1
  fi

  local string="$*"
  local delay=0.05  # Delay in seconds between each character

  # Loop through each character in the string
  for (( i = 1; i <= ${#string}; i++ )); do
    printf "\r%s" "${string:0:${i}}"  # Print the substring up to the current index
    sleep $delay
  done

  # Print a newline at the end to finalize the display
  echo
}

