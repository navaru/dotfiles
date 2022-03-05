#!/usr/bin/env bash

set -e

REPOSITORY="https://github.com/navaru/dotfiles.git"
DOTFILES="$HOME/.dotfiles"


log() {
  printf "$@\n"
}

is_command() {
  hash $1 2>/dev/null
}


# if file exists, create backup
set_backup() {
  if [ -f $1 ] || [ -L $1 ]; then
    mv "$1" "$1.backup"
  fi
}

# remove the backup files after symlinking
clean() {
  find $HOME -maxdepth 1 -name "*.backup" -delete
  echo "Cleaned backup files"
}

# clone dotfiles repository if not available
download_dotfiles() {
  if [ ! -d "$DOTFILES" ]; then
    git clone "$REPOSITORY" "$DOTFILES"
    log "Downloaded dotfiles to $DOTFILES"
  fi
}

# create the zshrc file that will source the dotfiles
set_zshrc() {
  local zshrc="$HOME/.zshrc"
  set_backup $zshrc
  echo 'source $HOME/.dotfiles/zshrc' > "$zshrc"
  log "Created: $zshrc"
}

# create symlinks to files from: dotfiles/symlinks
set_symlinks() {
  local files=("gitconfig" "vimrc")
  
  for filename in ${files[@]}; do
    set_backup "$HOME/.$filename"
    ln -s "$DOTFILES/$filename" "$HOME/.$filename"
    log "Symlink: $HOME/.$filename"
  done
}


main() {
  if ! is_command git; then
    log "You need to install git first"
    exit 1
  fi

  download_dotfiles
  set_zshrc 
  set_symlinks

  # parse options
  for option in $@; do
    case $option in
      -c|--clean) clean;;
    esac
  done
}


main $@
