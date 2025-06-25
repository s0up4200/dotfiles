# rename from servers.zsh to aliases.zsh 

# etc for linux servers

# brr related
#alias brr="vnstat -i $(/usr/sbin/route | grep '^default' | grep -o '[^ ]*$') -l"
#alias orphaned="qbittools orphaned"
#alias grab-new="~/scripts/grab-new.sh"
#alias tagjob="qbittools tagging --added-on --not-working --tracker-down --unregistered --last-activity"

# pacman
#alias pacman-upgrade="sudo pacman -Syu"     # Synchronize with repositories and then upgrade packages that are out of date on the local system.
#alias pacman-install="sudo pacman -S"        # Install specific package(s) from the repositories

# update dotfiles
alias update-dots='~/dotfiles/update.sh'

# show username with oh-my-zsh
PROMPT="$fg[cyan]%}$USER@%{$fg[blue]%}%m ${PROMPT}"

#humanlog
#curl -sSL "https://humanlog.io/install.sh" | bash
export HUMANLOG_INSTALL="/home/yotto/.humanlog"
export PATH="$HUMANLOG_INSTALL/bin:$PATH"

# ip stuff
alias ips="/sbin/ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias vpn="curl https://am.i.mullvad.net/ip && curl https://am.i.mullvad.net/country"

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'

# docker aliases
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcp='docker compose pull'
alias dcr='docker compose down && docker compose up -d'
alias docker-prune='sudo docker system prune -a --volumes --force'
alias logs='docker logs -f -n 50'

# Filesystem aliases
alias l="eza --long --all --header --git --icons"
alias la="eza --all --icons"
alias ll="eza --long --header --git --icons"
alias lld="eza --long --icons --only-dirs"
alias rmf="rm -rf"

# ffsend
alias upload="/usr/local/bin/ffsend upload"
alias download="/usr/local/bin/ffsend download"

## taildrop
alias tailcp="tailscale file cp"
alias tailgrab="sudo tailscale file get"

# Clear terminal
alias clr="clear"
alias shred_history="shred -u ~/.bash_history ~/.zsh_history && touch ~/.bash_history ~/.zsh_history"

# Trivy
alias trivy="docker run --runtime=runsc aquasec/trivy image"
alias trivy_all="docker ps --format '{{.Image}}' | xargs -I {} bash -c 'docker run --runtime=runsc aquasec/trivy image \"{}\" > trivy-scan-\$(echo {} | tr \"/\" \"-\").txt'"

# Goreleaser
alias build-all="goreleaser --snapshot --clean"

# tmux mosh
tmosh() {
  mosh --no-init $1 -- tmux new-session -ADs main
}

# Remote machine - Override shell window title
function override_title() {
  # Save old terminal state
  local oldstate="$(stty -g)"
  stty raw -echo
  printf '\033]0;%s\a' "$(hostname)"
  # Restore terminal state
  stty "$oldstate"
}

# Override terminal title settings
printf '\e]2;%s\a' "$(hostname)"
stty -icanon

# Set up hooks to maintain title
autoload -Uz add-zsh-hook
add-zsh-hook precmd override_title
add-zsh-hook preexec override_title 

# bat
alias cat="bat"
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
# wrapper around bat command to automatically pipe json files through jq
bat() {
    if [[ "$@" =~ \.json$ ]]; then
        command bat "$@" | jq
    else
        command bat "$@"
    fi
}

alias logsmoe='function _logsmoe() { 
    if [[ "$1" == "-" ]]; then
        curl https://logs.pizzly-dinosaur.ts.net --data-binary @-
    else
        curl https://logs.pizzly-dinosaur.ts.net --data-binary "@${1:--}"
    fi
}; _logsmoe'

# convert all flac files to 16bit
flac24to16() {
    for file in *.flac; do
        ffmpeg -i "$file" -sample_fmt s16 "${file%.flac}_16bit.flac"
    done
}

# other
alias hardlink="find /mnt/storage/media -path /mnt/storage/media/audiobooks -prune -o -type f -links 1 -printf '%h\n' | sort | uniq"
