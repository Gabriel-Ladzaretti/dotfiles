vscode_extensions_path = .vscode.extensions

.PHONY: freeze-extensions
freeze-extensions:
	code --list-extensions > ${vscode_extensions_path}

.PHONY: install-extension
install-extensions:
	cat ${vscode_extensions_path} | xargs -L 1 code --install-extension

.PHONY: dconf-dump
dconf-dump:
	dconf dump /org/gnome/terminal/ > org.gnome.terminal
	dconf dump /org/gnome/shell/extensions/ > org.gnome.shell.extensions

.PHONY: dconf-load-terminal
dconf-load-terminal:
	dconf load /org/gnome/terminal/ < org.gnome.terminal

.PHONY: dconf-load-extensions
dconf-load-extensions:
	dconf load /org/gnome/shell/extensions/ < org.gnome.shell.extensions

.PHONY: dconf-load
dconf-load: dconf-load-terminal dconf-load-extensions

.PHONY: freeze-all
freeze-all: freeze-extensions dconf-dump
