#!/bin/bash

set -e

DOTFILES_REPOSITORY="https://github.com/navaru/dotfiles.git"
DOTFILES_PATH="$HOME/.dotfiles"


log() {
  printf "$@\n"
}

is_command() {
  hash $1 2>/dev/null
}


# remove the backup files after symlinking
clean() {
  find $HOME -maxdepth 1 -name "*.backup" -delete
  echo "Cleaned backup files"
}


# create symlinks to files from: dotfiles/symlinks
setup_symlinks() {
  local symlinks=$(find $DOTFILES_PATH -name "*.symlink")

  for symlink in $symlinks; do
    local filename=$(basename $symlink)
    local file=$HOME/.${filename%.*}

    # if file exists, create backup
    if [ -f $file ] || [ -L $file ]; then
      mv "$file" "$file.backup"
    fi

    if (ln -s "$symlink" "$file"); then
      log "Created symlink: $file"
    fi
  done
}


main() {
  if ! is_command git; then
    log "You need to install git first"
    exit 1
  fi

  # clone repo if not available
  if [ ! -d "$DOTFILES_PATH" ]; then
    git clone "$DOTFILES_REPOSITORY" "$DOTFILES_PATH"
  fi

  setup_symlinks

  # parse options
  for option in $@; do
    case $option in
      -c|--clean) clean;;
    esac
  done
}


main $@