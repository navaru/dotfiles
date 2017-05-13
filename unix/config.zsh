# set node.js paths
export N_PREFIX=$HOME/.node
export NODE_BIN="./node_modules/.bin"
export PATH="$SCRIPTS:$NODE_BIN:$N_PREFIX/bin:$PATH"


echo "\n  Hello $(id -un)!"
