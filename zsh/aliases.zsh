# General editor default. `vim` muscle memory opens Neovim.
alias vim="nvim"

# Navigation: quick parent-directory jumps.
alias ......="cd ../../../../.."
alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd ../"

# Git: common short forms only. Keep project-specific git aliases in that repo.
alias gd="git diff"
alias gst="git status"
alias gaa="git add ."
alias gco="git checkout"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gc="git commit --signoff -S"

# Clipboard: pipe command output into the X clipboard.
# Example: `pwd | copy`
alias copy="xclip -sel clip"
alias jsontidy="xclip -o | jq '.' | copy"

# Desktop opener.
alias o=xdg-open

# Ansible.
alias av="ansible-vault"
alias ap="ansible-playbook"

# Docker: compact container list.
alias ds='docker ps --format '\''table {{.ID}}\t{{.Names}}\t{{.Status}}'\'''

# Edit files with sudo through $EDITOR instead of running the editor as root.
alias svim="sudoedit"

# Dotfiles helpers.
alias dotinstall="bash $DOTFILES/install.sh"
alias dotfiles="cd $DOTFILES"

# Compatibility aliases for Ubuntu package names.
alias bat="batcat"

# Webkom shortcuts. WEBKOMCODE belongs in .env.local.
alias webkom="cd $WEBKOMCODE"
alias legostart="cd $WEBKOMCODE/lego && docker compose up -d && source venv/bin/activate && python manage.py runserver"
alias legomigrate="cd $WEBKOMCODE/lego && source venv/bin/activate && python manage.py migrate"

