default:
	@echo "Please run 'make <target>' to set up your environment."

config-setup:
	mkdir -p ~/.config

bash_aliases:
	cp -i bash_files/.bash_aliases ~/.bash_aliases
	@echo "\nIf you haven't already, add the following to your ~/.bashrc:"
	@echo "═════════════════════════════════════════════════════════════"
	@echo "if [ -f ~/.bash_aliases ]; then"
	@echo "    . ~/.bash_aliases"
	@echo "fi"
	@echo "═════════════════════════════════════════════════════════════"

gitconfig:
	cp -i files/.gitconfig ~/.gitconfig

tmux:
	mkdir -p ~/.config/tmux
	cp -i files/tmux.conf ~/.config/tmux/tmux.conf

yazi: config-setup
	mkdir -p ~/.config/yazi
	mkdir -p ~/.config/yazi-img
	cp -i files/yazi.toml ~/.config/yazi/yazi.toml
	cp -i files/yazi-img.toml ~/.config/yazi-img/yazi.toml
	yazi --clear-cache

latexmk:
	cp -i files/.latexmkrc ~/.latexmkrc

latexindent:
	@echo "please copy files/defaultSettings.latexindent.yaml to the following location:"
	@bash -c 'latexindent -vv'

