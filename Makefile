link:
	scripts/link.sh
		
init:
	scripts/init.sh

brew-dump:
	brew bundle dump --force --file "~/dotfiles/preferences/brew/.Brewfile"
