# Export the .dotfiles path
export DOTFILES="$HOME/.dotfiles"
export OSNAME="$($DOTFILES/bin/get_os_name)"

noconfig() {
	echo "No config found for $OSNAME"
}

osx() {
	source $DOTFILES/osx/zshrc
}

linux() {
	source $DOTFILES/linux/zshrc
}

# Load OS specific configuration
case $OSNAME in
  darwin) osx;;
  linux) linux;;
  *) noconfig;;
esac

# Load config and plugins
for file in $DOTFILES/zsh/**/*.zsh; do
  source $file
done