VSCODE_EXTENSIONS_PATH = .vscode.extensions

.PHONY: all
all: freeze-vscode-extensions dconf-dump

.PHONY: freeze-vscode-extensions
freeze-vscode-extensions:
	code --list-extensions > ${VSCODE_EXTENSIONS_PATH}

.PHONY: install-vscode-extensions
install-vscode-extensions:
	cat ${VSCODE_EXTENSIONS_PATH} | xargs -L 1 code --install-extension

.PHONY: dconf-dump-terminal
dconf-dump-terminal:
	dconf dump /org/gnome/terminal/ > org.gnome.terminal

.PHONY: dconf-dump-gnome-extensions
dconf-dump-gnome-extensions:
	dconf dump /org/gnome/shell/extensions/ > org.gnome.shell.extensions

.PHONY: dconf-dump
dconf-dump: dconf-dump-terminal dconf-dump-gnome-extensions

.PHONY: dconf-load-terminal
dconf-load-terminal:
	dconf load /org/gnome/terminal/ < org.gnome.terminal

.PHONY: dconf-load-gnome-extensions
dconf-load-gnome-extensions:
	dconf load /org/gnome/shell/extensions/ < org.gnome.shell.extensions

.PHONY: dconf-load
dconf-load: dconf-load-terminal dconf-load-gnome-extensions

.PHONY: go-install
go-install:
	go install github.com/jesseduffield/lazygit@latest
