# OSX scripts path
export SCRIPTS="$(dirname $0)/bin"


# set node.js paths
export N_PREFIX=$HOME/.node
export NODE_BIN="./node_modules/.bin"


# Golang
export GOPATH="$HOME/go"


# Docker
alias dkr="docker"
alias dkrm="docker-machine"
alias dkrc="docker-compose"
dkrinit() { docker-machine env default }


# Export path last
export PATH="$SCRIPTS:$NODE_BIN:$N_PREFIX/bin:$PATH"


echo "\n  Hello $(id -un)!"