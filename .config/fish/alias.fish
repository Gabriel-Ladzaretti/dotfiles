# Version control
abbr -a g git
abbr -a gs git status -sb
abbr -a ga git add
abbr -a gc git commit
abbr -a gcm git commit -m
abbr -a gca git commit --amend
abbr -a gcl git clone
abbr -a gco git checkout
abbr -a gp git push
abbr -a gpl git pull
abbr -a gd git diff
abbr -a gds git diff --staged
abbr -a gf git fetch
abbr -a gl git log --oneline -n 15

# Dotfiles version control
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
abbr -a d dotfiles
abbr -a ds dotfiles status -sb
abbr -a da dotfiles add
abbr -a dc dotfiles commit
abbr -a dcm dotfiles commit -m
abbr -a dca dotfiles commit --amend
abbr -a dcl dotfiles clone
abbr -a dco dotfiles checkout
abbr -a dp dotfiles push
abbr -a dpl dotfiles pull
abbr -a dd dotfiles diff
abbr -a dds dotfiles diff --staged
abbr -a df dotfiles fetch
abbr -a dl dotfiles log --oneline -n 15

# Obsidian version control
alias obsidian='/usr/bin/git -C $HOME/GitHub/Gabriel-Ladzaretti/obsidian'
alias oct="obsidian commit -m \"$(date +'%Y-%m-%d %H:%M:%S')\""
abbr -a o obsidian
abbr -a os obsidian status -sb
abbr -a oa obsidian add
abbr -a oc obsidian commit
abbr -a ocm obsidian commit -m
abbr -a oca obsidian commit --amend
abbr -a ocl obsidian clone
abbr -a oco obsidian checkout
abbr -a op obsidian push
abbr -a opl obsidian pull
abbr -a od obsidian diff
abbr -a ods obsidian diff --staged
abbr -a of obsidian fetch
abbr -a ol obsidian log --oneline -n 15

# Copy to clipboard
alias xclip='xclip -selection c'

# Tmux shortcuts
alias tmux='tmux -u'
alias tmuxx='tmux new-session -A -s'

# Navigation
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..' # Address cd typo

# Code with wayland enabled
alias code='code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto --unity-launch $argv  > /dev/null 2>&1'

# misc
alias reload='exec fish'
