#!/bin/bash

set -e

DOTFILES_REPOSITORY="https://github.com/teugen/dotfiles.git"
DOTFILES="$HOME/.dotfiles"


is_command() {
  hash $1 2>/dev/null
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

    if (ln -s "$symlink" "$file"); then
      echo "Created symlink: $file"
    fi
  done
}


# remove the backup files after symlinking
clean() {
  rm -rf "$HOME/*.backup"
}


main() {
  if ! is_command git; then
    echo "You need to install git first"
    exit 1
  fi

  # clone repo if not available
  if [ ! -d "$DOTFILES" ]; then
    git clone "$DOTFILES_REPOSITORY" "$DOTFILES"
  fi

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