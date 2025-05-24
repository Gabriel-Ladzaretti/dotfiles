# Personal Linux Dotfiles

## Tracking `dotfiles` directly with Git[^1][^2]
The "bare repository and alias method" popularized on [Ask Hacker News: What do you use to manage your dotfiles?](https://news.ycombinator.com/item?id=11071754), takes just three commands to set up:

```bash
$ git init --bare ~/.dotfiles
$ alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
$ dotfiles config status.showUntrackedFiles no
```

Then any file within the home folder can be versioned with normal commands like:
```bash
$ dotfiles status
$ dotfiles add .vimrc
$ dotfiles commit -m "Add vimrc"
$ dotfiles add .config/redshift.conf
$ dotfiles commit -m "Add redshift config"
$ dotfiles push
```

## Restoring dotfiles on a new system

Your dotfiles can be replicated on a new system like: 
```bash
$ git clone --bare <git-repo-url> $HOME/.dotfiles
$ alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
$ dotfiles checkout
$ dotfiles config --local status.showUntrackedFiles no
```


[^1]: https://wiki.archlinux.org/title/Dotfiles 
[^2]: https://news.ycombinator.com/item?id=11071754
