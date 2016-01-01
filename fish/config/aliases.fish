# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias -='cd -'

# List direcory contents
alias l='ls -lh'
alias la='ls -Gla'
alias lsa='ls -hFA'
alias ll='ls -lhFA'
alias lsd='ls -l | grep "^d"' # list only dirs

# Show file size in bytes
alias fs='stat -f \"%z bytes\"'

# IP addresses
alias ip-wan='dig +short myip.opendns.com @resolver1.opendns.com'
alias ip-lan='ifconfig -a | grep -oE "([0-9]{1,3}[\.]){3}[0-9]{1,3}"'

# Enhanced WHOIS lookups
alias whois='whois -h whois-servers.net'

# Shotcut for node ECMAScript 6
alias es='babel-node'

# Docker
alias dkr='docker'
alias dm='docker-machine'
alias dcom='docker-compose'