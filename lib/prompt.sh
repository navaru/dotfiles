git_status() {
  local git_clean="nothing to commit"
  local git_unstaged="Changes not staged for commit"
  local git_staged="Changes to be committed"

  local git_status="$(git status 2> /dev/null)"
  local color

  if [[ $git_status =~ $git_unstaged ]]; then
    color="red"

    if [[ $git_status =~ $git_staged ]]; then
      color="yellow"
    fi
  elif [[ $git_status =~ $git_staged ]]; then
    color="green"
  elif [[ $git_status =~ $git_clean ]]; then
    return
  fi

  echo $(set_text $color "◉")
}


git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}


git_prompt() {
  # check if git repository
  if git branch &> /dev/null; then
    echo " ⊷ $(git_branch) $(git_status)"
  fi
}


prompt() {
  local pwd="$(set_text blue ${PWD/#$HOME/\~})"
  local cmd=" ▸ "

  local prompt="\n$pwd$(git_prompt)\n$cmd"

  printf "$prompt"
}

rprompt() {
  local lineup=$'\e[1A'
  local linedown=$'\e[1B'
  local hostname="%{$fg[green]%}☵ $(hostname) ℷ $(whoami)%{$reset_color%}"

  echo "%{$lineup%}$hostname%{$linedown%}"
}

PS1='$(prompt)'
RPROMPT='$(rprompt)'
