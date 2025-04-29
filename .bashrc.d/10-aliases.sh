#!/bin/bash

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias d="dotfiles"

alias obsidian='/usr/bin/git -C $HOME/GitHub/Obsidian'
alias o='/usr/bin/git -C $HOME/GitHub/Obsidian'

alias pbcopy='xsel -ib'
alias pbpaste='xsel -ob'

alias tmux='tmux -u'
alias tmuxx='tmux new-session -A -s'

alias g="git"

alias v='vim'
alias k='kubectl'

