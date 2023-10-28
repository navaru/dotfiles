# zsh path plugins, extensions, etc
fpath=(
  $HOME/.zsh
  "${fpath[@]}"
)

# history
HISTFILE=$HOME/.history.zsh
HISTSIZE=5000
SAVEHIST=5000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

# ls colors
autoload -Uz colors; colors;

setopt No_Beep
setopt auto_cd
setopt multios

# completion
autoload -Uz compinit; compinit -u;