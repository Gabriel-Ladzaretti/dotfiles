VSCODE_EXTENSIONS_PATH = .vscode.extensions

.PHONY: all freeze-vscode-extensions \
		install-vscode-extensions \
        dconf-dump-terminal \
		dconf-dump-gnome-extensions dconf-dump \
        dconf-load-terminal \
		dconf-load-gnome-extensions dconf-load \
        go-install vscode-hide-appicon

all: freeze-vscode-extensions dconf-dump

freeze-vscode-extensions:
	code --list-extensions > ${VSCODE_EXTENSIONS_PATH}

install-vscode-extensions:
	cat ${VSCODE_EXTENSIONS_PATH} | xargs -L 1 code --install-extension

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

go-install:
	go install github.com/jesseduffield/lazygit@latest

vscode-hide-appicon:
	sudo sed -i \
		's/window-appicon{width:35px/window-appicon{visibility:hidden,width:35px/' \
		/usr/share/code/resources/app/out/vs/workbench/workbench.desktop.main.css