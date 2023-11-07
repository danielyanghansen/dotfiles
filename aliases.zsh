# General
alias vim="nvim"

alias ......="cd ../../../../.."
alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd ../"
# Git
alias gd="git diff"
alias gst="git status"
alias gaa="git add ."
alias gco="git checkout"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gc="git commit --signoff -S"


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

# Docker
alias ds='docker ps --format '\''table {{.ID}}\t{{.Names}}\t{{.Status}}'\'''

# Sudo vim
alias svim="sudoedit"

# Utils
alias dotinstall="bash $DOTFILES/install.sh"
alias vimconfig="nvim $DOTFILES/init.vim && cp $DOTFILES/init.vim $HOME/.config/nvim/init.vim"


#Other
alias bat="batcat"
alias lsa="lsd -la"
alias dotfiles="cd $DOTFILES"

#Webkom
alias webkom="cd $WEBKOMCODE"
alias legostart="cd $WEBKOMCODE/lego && docker-compose up -d && source venv/bin/activate && python manage.py runserver"
alias legomigrate="cd $WEBKOMCODE/lego && source venv/bin/activate && python manage.py migrate"

