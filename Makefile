
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

latexmk:
	cp -i files/.latexmkrc ~/.latexmkrc

yazi: config-setup
	mkdir -p ~/.config/yazi
	cp -i files/yazi.toml ~/.config/yazi/yazi.toml


latexindent:
	@echo "please copy files/defaultSettings.latexindent.yaml to the following location:"
	@bash -c 'latexindent -vv'
