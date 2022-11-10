# General
alias ..="cd ../"
alias ...="cd../.."
alias ....="cd../../.."
alias .....="cd../../../.."
alias ......="cd../../../../.."
alias vim="nvim"

# Git
alias gd="git diff"
alias gst="git status"
alias gaa="git add ."
alias gco="git checkout"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force-with-lease"



# Clipboard
# $<some command> | copy
alias copy="xclip -sel clip"

# Format json in clipboard
alias jsontidy="xclip -o | jq '.' | copy"

# XDG open
alias o=xdg-open

# Ansible
alias av="ansible-vault"
alias ap="ansible-playbook"

# Sudo vim
alias svim="sudoedit"





#Other
alias bat="batcat"
