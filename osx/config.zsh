# OSX scripts path
export SCRIPTS="$(dirname $0)/bin"


# set node.js paths
export N_PREFIX=$HOME/.node
export NODE_BIN="./node_modules/.bin"


# Docker
alias dkr="docker"
alias dkrm="docker-machine"
alias dkrc="docker-compose"


# set golang paths
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


# Export path last
export PATH="$SCRIPTS:$NODE_BIN:$N_PREFIX/bin:$PATH"


echo "\n  Hello $(id -un)!"