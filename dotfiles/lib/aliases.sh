# Pipe Aliases (Global)
alias -g L='|less'
alias -g G='|grep'
alias -g T='|tail'
alias -g H='|head'
alias -g W='|wc -l'
alias -g S='|sort'

# Show history
alias history='fc -l 1'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# List direcory contents
alias l='ls -lh'
alias lsa='ls -hFA'
alias ll='ls -lhFA'
alias lsd='ls -l | grep "^d"' # list only dirs

# Show last modified file
alias lastmodified="ls -t $* 2> /dev/null | head -n 1"

# Show file size in bytes
alias fs="stat -f \"%z bytes\""

# IP addresses
alias ip-wan="dig +short myip.opendns.com @resolver1.opendns.com"
alias ip-lan="ifconfig -a | grep -oE '([0-9]{1,3}[\.]){3}[0-9]{1,3}'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Shotcut for node harmony
alias nodeh="node --harmony"
