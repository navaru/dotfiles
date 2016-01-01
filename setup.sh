#!/bin/bash

set -e

DOTFILES_REPOSITORY="https://github.com/teugen/dotfiles.git"
DOTFILES="$HOME/.dotfiles"


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
  local symlinks=$(find $DOTFILES -name "*.symlink")

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


setup_fishshell() {
  local os=$($DOTFILES/bin/get_os_name)
  local source="$DOTFILES/fish"
  local target="$HOME/.config/fish"
  local fish=$(which fish)

  log "Setting up fishshell:\n"

  if ! is_command fish; then
    log "fishshell not installed"
    return 0
  fi

  # create fish config directory
  [ -d $target ] && rm -rf $target

  mkdir -p $target

  ln -s "$source/config.fish" "$target/config.fish"
  ln -s "$source/config" "$target/config"

  log "Created fishshell symlinks"

  # make fish the default shell
  if ! chsh -s $fish; then
    # add path to /etc/shells as it not a default shell
    echo $fish | sudo tee -a /etc/shells
    chsh -s $fish
  fi
}


main() {
  if ! is_command git; then
    log "You need to install git first"
    exit 1
  fi

  # clone repo if not available
  if [ ! -d "$DOTFILES" ]; then
    git clone "$DOTFILES_REPOSITORY" "$DOTFILES"
  fi

  setup_symlinks

  # parse options
  for option in $@; do
    case $option in
      -c|--clean) clean;;
    esac
  done

  setup_fishshell
}


main $@