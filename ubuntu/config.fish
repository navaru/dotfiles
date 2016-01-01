# enable autojumb
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Go path project setup
export GOPATH="$HOME/Code/local/go"

# homebrew
export PATH="$(brew --prefix homebrew/php/php56)/bin:/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/Code/local/google-cloud-sdk/path.zsh.inc"

# docker env config
eval "$(docker-machine env default)"
