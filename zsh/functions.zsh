# log <type> <msg>
log() {
  printf "\033[36m %s \033[0m\n" "$@"
}


# exit the script and output error
# abort <msg>
abort() {
  printf "\n  \033[31mError: %s \033[0m\n" "$@"
  exit 1
}


# check if a command exists
# is_command <command>
is_command() {
  hash $1 > /dev/null
}


# Parse end return only the version
# semver "Darwin Kernel Version 13.2.0" -> "13.2.0"
semver() {
  echo $@ | egrep -o '[0-9]*[.][0-9]*[.][0-9]*([0-9A-Za-z-]*)'
}


# get the path of the file
filepath() {
  $(cd $(dirname "$0") && pwd)
}


# ask a question
ask() {
  local question=$1
  local answer

  echo -n "$question > [Y/N] "
  read answer

  case $ans in
    [Yy]) echo $answer;;
    *) echo "Type Y for 'Yes' or N for 'No'"; ask $answer;;
  esac
}


# Check if the HEAD response of <url> is 200.
check_url() {
  curl -Is $1 | head -n 1 | grep 200 > /dev/null
}


# Set text format
# set_text <color> <backgound> <type> "hey sexy"
set_text() {
  local text="${@: -1}"
  local color=30
  local type
  local background
  local format

  for option in $@; do
    case $option in
      # text format
           bold) type=1 ;;
      underline) type=4 ;;
        reverse) type=7 ;;

      # text color
        black) color=30 ;;
          red) color=31 ;;
        green) color=32 ;;
       yellow) color=33 ;;
         blue) color=34 ;;
      magenta) color=35 ;;
         cyan) color=36 ;;
        white) color=37 ;;

      # background color
        bgblack) background=40 ;;
          bgred) background=41 ;;
        bggreen) background=42 ;;
       bgyellow) background=43 ;;
         bgblue) background=44 ;;
      bgmagenta) background=45 ;;
         bgcyan) background=46 ;;
        bgwhite) background=47 ;;
    esac
  done

  format="${color}"

  [ -n "$type" ] && format="$type;$format"
  [ -n "$background" ] && format="$format;$background"

  echo -e "\033[${format}m${text}\033[0m"
}