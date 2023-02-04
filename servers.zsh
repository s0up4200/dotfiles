# etc for linux servers

# brr related
alias brr="vnstat -i $(/usr/sbin/route | grep '^default' | grep -o '[^ ]*$') -l"
alias orphaned="qbittools orphaned"
alias grab-new="~/scripts/grab-new.sh"
alias tagjob="qbittools tagging --added-on --not-working --tracker-down --unregistered --last-activity"

#gpg
#export GPG_TTY=$(tty)

# pacman
#alias pacman-upgrade="sudo pacman -Syu"     # Synchronize with repositories and then upgrade packages that are out of date on the local system.
#alias pacman-install="sudo pacman -S"        # Install specific package(s) from the repositories

# show username with oh-my-zsh
#PROMPT="$fg[cyan]%}$USER@%{$fg[blue]%}%m ${PROMPT}"

# ip stuff
alias ips="/sbin/ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'

# Filesystem aliases
alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# ffsend
alias upload="/usr/local/bin/ffsend upload --host https://send.r4tio.dev"
alias download="/usr/local/bin/ffsend download"

# Clear terminal
alias clr="clear"

# Goreleaser
alias build-all="goreleaser --snapshot --rm-dist"
