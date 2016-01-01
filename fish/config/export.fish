# remove fish greeting
set -gx fish_greeting ''

set -gx DOTFILES $HOME/.dotfiles
set -gx APPS_PATH $HOME/.apps

set PATH $PATH /usr/local/bin $DOTFILES/bin

# set node.js paths
set -gx N_PREFIX $APPS_PATH/node
set PATH $PATH ./node_modules/.bin