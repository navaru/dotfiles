# import config files
source $HOME/.config/fish/config/export.fish
source $HOME/.config/fish/config/prompt.fish
source $HOME/.config/fish/config/aliases.fish

# Load OS specific configuration
switch (eval $DOTFILES/bin/get_os_name)
case "darwin"
  source $DOTFILES/osx/config.fish
case "ubuntu"
  source $DOTFILES/ubuntu/config.fish
end