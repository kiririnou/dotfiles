#!/bin/sh

# setup aliases
alias vim="nvim"
alias ll="ls -l"
alias la="ls -la"
alias l="ls"

# bind Ctrl+F to call tmux-sessionizer
bind \"\\C-f\":\"$HOME/.local/scripts/tmux-sessionizer\\n\"
