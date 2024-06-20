source ~/.config/fish/functions/navigation.fish
source ~/.config/fish/alias.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
   
    # Function to display fastfetch welcome screen 
    # if running in alacritty terminal
    function alacritty_welcome
        set bin fastfetch
        if test "$TERM" = "alacritty"
            and type -q $bin
            command $bin
        end
    end
   
    alacritty_welcome
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
set -g fish_color_error '#F9E2AF' '--bold' # yellow
set -g fish_color_escape '#F9E2AF'  '--bold' # yellow
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator '#F9E2AF' # yellow
set -g fish_color_param '#89DDFF' '--bold' # cyan
set -g fish_color_quote '#DFFF00' # very bright greenish yellow
set -g fish_color_redirection '#89B4FA' # blue
set -g fish_color_search_match '#F9E2AF'  '--background=brblack' # fg=yellow
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user '#A6E3A1' #green
set -g fish_color_valid_path --underline
# set -g fish_color_error '#ff79a8' '--bold'
# set -g fish_color_param cyan

starship init fish | source
