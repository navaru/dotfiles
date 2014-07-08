export LSCOLORS="Gxfxcxdxbxegedabagacad" # ls colors
export GREP_OPTIONS='--color=auto' # Color grep results
export GREP_COLOR='1;32'


autoload colors; colors;
autoload -U compinit

compinit


setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE
setopt auto_cd
setopt multios
setopt cdablevars
setopt prompt_subst  # setup the prompt with pretty colors
setopt correct_all
setopt NO_BEEP
setopt local_options # allow functions to have local options
setopt local_traps # allow functions to have local traps
#setopt complete_aliases # don't expand aliases _before_ completion has finished; like: git comm-[tab]


# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]; then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi


## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000


setopt append_history
setopt extended_history # add timestamps to history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data


# bindkeys
bindkey '[D' backward-word  # ctrl + left
bindkey '[C' forward-word   # ctrl + right


#Disable core dumps
limit coredumpsize 0

#自动补全功能

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
# zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:cd:*' ignore-parents parent tag-order local-directories directory-stack path-directories

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate


# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

zmodload  zsh/complist
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
