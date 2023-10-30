# Navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# List direcory contents
alias ls='ls -G'
alias l="ls -lh"
alias la="ls -Gla"
alias lsa="ls -hFA"
alias ll="ls -lhFA"
alias lsd="ls -l | grep "^d"" # list only dirs

# Show file size in bytes
alias fs="stat -f \"%z bytes\""

# Show all running apps and ports
alias lsports="sudo lsof -i -P -n"

# Reload zshrc
alias reload="source ~/.zshrc"

# Mac address vendor lookup => macvendor 00:11:22:33:44:55
alias macvendor="curl -s 'http://api.macvendors.com/$1'"

# Networking
alias icanhazip="curl 'icanhazip.com'"
alias ip_info="curl 'ipinfo.io'"
alias ip_web="dig +short myip.opendns.com @resolver1.opendns.com"
alias ip_lan="ifconfig en0 | grep inet | awk '{ print $2 }'"

# Encryption
encrypt() { echo $@ | openssl enc -e -a -base64 -aes-256-cbc -iter 30 -salt; }
decrypt() { echo $@ | openssl enc -d -base64 -aes-256-cbc -iter 30 -salt; }
