# FZF configuration
#

set WALKER_SKIP_OPTS ".git,node_modules,target"

# Modified catppuccin theme
# https://github.com/catppuccin/fzf
set COLOR_SCHEMA "
    --color=spinner:#f5e0dc,hl:#f38ba8
    --color=header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
    --color=marker:#b4befe,prompt:#cba6f7,hl+:#f38ba8
    --multi
"

# Define options for FZF_DEFAULT_OPTS
set -l opts "
    --walker-skip $WALKER_SKIP_OPTS
    --layout reverse
    --height 40%
    --tmux 80%
    --border top
"
set -x FZF_DEFAULT_OPTS (string join " " $opts)


# Define options for FZF_CTRL_T_OPTS
set -l opts "
    --preview 'bat -n --color=always {}'
    --preview-window hidden
    --bind 'ctrl-/:change-preview-window(right|down|hidden)'
"
set -x FZF_CTRL_T_OPTS (string join " " $opts)


# Define options for FZF_CTRL_R_OPTS
set -l opts "
    --bind 'ctrl-y:execute-silent(echo -n {2..} | xsel -ib)+abort'
    --color header:italic
    --header 'Press CTRL-Y to copy command into clipboard'
"
set -x FZF_CTRL_R_OPTS (string join " " $opts)


# Define options for FZF_ALT_C_OPTS
set -l opts "
   --preview-window hidden
   --bind 'ctrl-/:change-preview-window(right|down|hidden)'
   --preview 'tree -C {}'
"
set -x FZF_ALT_C_OPTS (string join " " $opts)

