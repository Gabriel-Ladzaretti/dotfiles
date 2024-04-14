vscode_extensions_path = .vscode.extensions

.PHONY: freeze-vscode-extensions
freeze-vscode-extensions:
	code --list-extensions > ${vscode_extensions_path}

.PHONY: install-vscode-extensions
install-vscode-extensions:
	cat ${vscode_extensions_path} | xargs -L 1 code --install-extension

.PHONY: dconf-dump-terminal
dconf-dump-terminal:
	dconf dump /org/gnome/terminal/ > org.gnome.terminal

.PHONY: dconf-dump-gnome-extensions
dconf-dump-gnome-extensions:
	dconf dump /org/gnome/shell/extensions/ > org.gnome.shell.extensions

.PHONY: dconf-dump
dconf-dump: dconf-dump-terminal dconf-dump-extensions

.PHONY: dconf-load-terminal
dconf-load-terminal:
	dconf load /org/gnome/terminal/ < org.gnome.terminal

.PHONY: dconf-load-gnome-extensions
dconf-load-gnome-extensions:
	dconf load /org/gnome/shell/extensions/ < org.gnome.shell.extensions

.PHONY: dconf-load
dconf-load: dconf-load-terminal dconf-load-extensions

.PHONY: freeze-all
freeze-all: freeze-extensions dconf-dump
