function log
  printf "$argv"
end


function git_branch
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end


function git_status
  set -l repo_status (git status)

  switch "$repo_status"
    case '*Untracked files*'
      set_color red
    case '*Changes not staged for commit*'
      set_color yellow
    case '*Changes to be committed*'
      set_color green
  end

  printf '◉'
end


function git_prompt
  if git branch > /dev/null ^&1
    log "⊷ "(git_branch) (git_status)
  end
end


function fish_prompt
  log '\n'
  set_color blue
  log (pwd | sed -e 's>'"$HOME"'>~>')" "
  set_color normal
  git_prompt
  set_color blue
  log '\n ▸ '
  set_color normal
end


function fish_right_prompt
  set_color 999999
  log (whoami)
  set_color white
  log "@"
  set_color 999999
  log (hostname)
end