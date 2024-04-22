vscode_extensions_path = .vscode.extensions

.PHONY: all freeze-vscode-extensions install-vscode-extensions dconf-dump-terminal dconf-dump-gnome-extensions dconf-dump dconf-load-terminal dconf-load-gnome-extensions dconf-load

all: freeze-vscode-extensions dconf-dump

freeze-vscode-extensions:
	code --list-extensions > ${vscode_extensions_path}

install-vscode-extensions:
	cat ${vscode_extensions_path} | xargs -L 1 code --install-extension

dconf-dump-terminal:
	dconf dump /org/gnome/terminal/ > org.gnome.terminal

dconf-dump-gnome-extensions:
	dconf dump /org/gnome/shell/extensions/ > org.gnome.shell.extensions

dconf-dump: dconf-dump-terminal dconf-dump-gnome-extensions

dconf-load-terminal:
	dconf load /org/gnome/terminal/ < org.gnome.terminal

dconf-load-gnome-extensions:
	dconf load /org/gnome/shell/extensions/ < org.gnome.shell.extensions

dconf-load: dconf-load-terminal dconf-load-gnome-extensions
