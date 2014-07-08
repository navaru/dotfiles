#!/bin/bash

set -e

# set path where apps will be installed
if [ -n "$APPS_PATH" ]; then
  APPS_PATH="$HOME/.apps"
fi


# parse a string and return the version
semver() {
  echo $@ | egrep -o '[0-9]*[.][0-9]*[.][0-9]*([0-9A-Za-z-]*|[.][0-9]*)'
}


# check if a command is available
is_command() {
  hash $1 2> /dev/null
}


# install git from source:
# git_install <version>
git_install() {
  # install git
  local version=$1
  local source="https://www.kernel.org/pub/software/scm/git/git-$version.tar.gz"

  # download and untar source
  curl -# -L $source | tar -zx -C /tmp
  cd /tmp/git-$version

  # set option to compile git without gettext
  export NO_GETTEXT=1

  # compile git
  make prefix="$APPS_PATH/git" install

  # add git to path
  PATH=$APPS_PATH/git/bin:$PATH
}


# check if desired git version is installed
git_setup() {
  if is_command git; then
    local git_version=2.0.0
    local git_current_version=$(semver $(git --version))

    # check if desired git version is available
    if [[ git_current_version < git_version ]]; then

      # check if curl is installed
      if ! is_command curl; then
        echo "curl not installed"
        exit 1
      fi

      echo "Installing git v$git_version"

      git_install $git_version
    fi
  fi
}


main() {
  # create apps path if not available
  [ -d "$APPS_PATH" ] || mkdir -p "$APPS_PATH"

  git_setup

  # install & setup dotfiles
  git clone https://github.com/navaru/dotfiles.git $HOME/.dotfiles2

  # initiate setup
  $HOME/.dotfiles/setup.sh --clean
}

main $@