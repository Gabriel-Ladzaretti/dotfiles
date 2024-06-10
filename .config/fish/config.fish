if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable intro greeting
set fish_greeting

# Fish syntax highlighting
set -g fish_color_autosuggestion '555' 'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment '#F38BA8' # red
set -g fish_color_cwd '#A6E3A1' # green
set -g fish_color_cwd_root '#F38BA8' # red
set -g fish_color_end '#F5C2E7' # brmagenta
# set -g fish_color_error '#ff79a8' '--bold'
set -g fish_color_error '#F9E2AF' '--bold' # yellow
set -g fish_color_escape '#F9E2AF'  '--bold' # yellow
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator '#F9E2AF' # yellow
# set -g fish_color_param cyan
set -g fish_color_param '#89DDFF' '--bold' # cyan
set -g fish_color_quote '#DFFF00' # very bright greenish yellow
set -g fish_color_redirection '#89B4FA' # blue
set -g fish_color_search_match '#F9E2AF'  '--background=brblack' # fg=yellow
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user '#A6E3A1' #green
set -g fish_color_valid_path --underline

starship init fish | source

# Dotfiles version control
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias d='dotfiles'

# Obsidian
alias obsidian='/usr/bin/git -C $HOME/GitHub/Obsidian'
alias o='/usr/bin/git -C $HOME/GitHub/Obsidian'

# Copy to clipboard
alias xclip='xclip -selection c'

# Tmux shortcuts
alias tmux='tmux -u'
alias tmuxx='tmux new-session -A -s'

# General VCS
alias g='git'

# Directory navigation
alias ...='cd ../..'
alias ....='cd ../../..'
# Address cd typo
alias cd..='cd ..'
alias docs='cd ~/Documents'
alias dls='cd ~/Downloads'


# if status is-interactive
# and not set -q TMUX
#     exec tmux new-session -A -s Home
# end

