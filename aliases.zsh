#show username with oh-my-zsh
PROMPT="$fg[cyan]%}$USER@%{$fg[blue]%}%m ${PROMPT}"

#ip stuff
alias ips="/sbin/ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias vpn="curl https://am.i.mullvad.net/connected"

##ffsend https://github.com/timvisee/ffsend
alias upload="/opt/homebrew/bin/ffsend upload --host https://send.r4tio.cat"
