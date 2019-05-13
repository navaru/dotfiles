# ensure you are using the brew installed versions
# make sure /usr/local/sbin is before /usr/sbin in your PATH
PATH="/usr/local/sbin:$PATH"


# OSX scripts path
export SCRIPTS="$(dirname $0)/bin"


# set node.js paths
export N_PREFIX="$HOME/.node"
export NODE_YARN="$HOME/.yarn/bin"
export NODE_GLOBAL="$N_PREFIX/bin"
export NODE_LOCAL="./node_modules/.bin"
export NODE_PATHS="$NODE_YARN:$NODE_LOCAL:$NODE_GLOBAL"


# set php paths
export COMPOSER_GLOBAL="$HOME/.composer/vendor/bin"
export COMPOSER_LOCAL="./vendor/bin"
export PHP_PATHS="$COMPOSER_GLOBAL:$COMPOSER_LOCAL"


# Docker
alias dkr="docker"
alias dkrm="docker-machine"
alias dkrc="docker-compose"


# set golang paths
export GOPATH=$HOME/.go
export GOROOT=$(brew --prefix golang)/libexec
export PATH=$PATH:${GOPATH}/bin:${GOROOT}/bin


# set android sdk paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


# Export PATH last
export PATH="$SCRIPTS:$NODE_PATHS:$PHP_PATHS:$PATH"


echo "\n  Hello $(id -un)!"
