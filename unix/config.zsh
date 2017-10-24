# make sure /usr/local/sbin is before /usr/sbin in your PATH
PATH="/usr/local/sbin:$PATH"

# set node.js paths
export N_PREFIX="$HOME/.node"
export NODE_YARN="$HOME/.yarn/bin"
export NODE_GLOBAL="$N_PREFIX/bin"
export NODE_LOCAL="./node_modules/.bin"


# Export PATH last
export PATH="$PATH:$NODE_YARN:$NODE_LOCAL:$NODE_GLOBAL"


echo "\n  Hello $(id -un)!"