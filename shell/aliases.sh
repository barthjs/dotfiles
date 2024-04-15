# Easier navigation for cd
alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."

# Shortcuts
alias doc="cd ~/Documents"
alias dol="cd ~/Downloads"
alias pic="cd ~/Pictures"
alias vid="cd ~/Videos"
alias dev="cd ~/dev"
alias pro="cd ~/dev/projects"
alias dot="cd ~/.dotfiles"

# Files
alias l="eza --group-directories-first"
alias ll="eza --group-directories-first -l"
alias la="eza --group-directories-first -la"
alias ld="eza --group-directories-first -laD"
alias lf="eza --group-directories-first -laf"
alias rmd='rm -rf'
alias arc="archive"
alias tarc="tarchive"

# Always enable colored `grep` output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Network
alias publicip="curl ifconfig.me/ip ; echo"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# bat
alias bata='bat --show-all'
alias batp='bat --paging=never'

# Docker
alias dex="docker-ex"
alias di="docker inspect"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcs="docker compose stop"
alias dcr="docker compose restart"
alias dcud="docker compose -f compose.dev.yaml up -d"
alias dcdd="docker compose -f compose.dev.yaml down"
alias dcsd="docker compose -f compose.dev.yaml stop"
alias dcrd="docker compose -f compose.dev.yaml restart"

# Git
alias gnah='git reset --hard;git clean -dfx'
alias uncommit="git reset --soft HEAD~1"

# Fastfetch
alias ff="fastfetch"

# Lazygit
alias lgit='lazygit'

# Python
alias py="python3"

# Visual Studio Code
alias code="code ."
