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

  echo -n $(set_text $color " ●")
}


git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}


git_prompt() {
  # check if git repository
  if git branch &> /dev/null; then
    echo -n " ⊷ $(git_branch)$(git_status)"
  fi
}

prompt() {
  local location="%{$fg[green]%}$(whoami)%{$reset_color%}"
  local pwd="$(set_text blue ${PWD/#$HOME/\~})"
  local cmd="%{$fg[blue]%} $ %{$reset_color%}"
  local prompt="\n$pwd$(git_prompt) — $location\n$cmd"

  echo -n "$prompt"
}

PS1='$(prompt)'
