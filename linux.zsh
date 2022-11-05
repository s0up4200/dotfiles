# etc for linux
alias brr="vnstat -i $(/usr/sbin/route | grep '^default' | grep -o '[^ ]*$') -l"
alias orphaned="qbittools orphaned"
alias grab-new="~/scripts/grab-new.sh"
alias tagjob="qbittools tagging --added-on --not-working --tracker-down --unregistered --last-activity"

# show username with oh-my-zsh
#PROMPT="$fg[cyan]%}$USER@%{$fg[blue]%}%m ${PROMPT}"

# ip stuff
alias ips="/sbin/ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'

# ffsend
alias upload="/usr/local/bin/ffsend upload --host https://send.r4tio.cat"

# Clear terminal
alias clr="clear"
