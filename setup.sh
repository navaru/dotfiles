#!/bin/bash

DOTFILES=$(cd $(dirname "$0") && pwd)
APPS_PATH="$HOME/.apps"


zsh_setup() {
  local least_version="5.0.0"

  # check if zsh is installed
  if is_command zsh; then
    local current_version=$(semver $(zsh --version) | head -n 1)

    # check if desired zsh version is available
    [[ $current_version < $least_version ]] && zsh_install
  else
    zsh_install
  fi

  # TODO: make zsh default ?
}


zsh_install() {
  local source="http://www.zsh.org/pub/zsh.tar.gz"
  local tmp="/tmp/zsh-source"
  mkdir -p $tmp

  log "Downloading $source"

  # download and untar source
  curl -# -L $source | tar -zx -C $tmp

  log "Installing zsh"

  cd $tmp/zsh-*
  ./configure --prefix="$APPS_PATH/zsh"
  make
  make install
}


# create symlinks to files from: dotfiles/symlinks
create_symlinks() {
  local symlinks=$(find $DOTFILES -name "*.symlink")

  for symlink in $symlinks; do
    local filename=$(basename $symlink)
    local file=$HOME/.${filename%.*}

    # if file exists, create backup
    if [ -f $file ] || [ -L $file ]; then
      mv "$file" "$file.backup"
    fi

    ln -s "$symlink" "$file"
    log "Created symlink: $file"
  done
}


# clean backup files
clean() {
  for file in $HOME/.*.backup; do
    log "Removed: $file"
    rm "$file"
  done
}


main() {
  # load helper funtions
  source "$DOTFILES/lib/functions.sh"

  # install or update zsh
  zsh_install

  # create symlink to .files
  create_symlinks

  # parse options
  for option in $@; do
    case $option in
      -c|--clean) clean;;
    esac
  done
}

main $@