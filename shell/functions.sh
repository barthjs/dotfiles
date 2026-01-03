# Create a new directory and enter it
mkd() {
    mkdir -p "$@" && cd "$@"
}

# Normalize 'open' across Linux and Windows.
if grep -q WSL2 /proc/version; then
    alias open='explorer.exe'
else
    alias open='xdg-open'
fi

# 'o' with no arguments opens the current directory, otherwise opens the given location
o() {
    if [ $# -eq 0 ]; then
        open .
    else
        open "$@"
    fi
}

# Zip or unzip a file or directory
archive() {
    if [ -z "$1" ]; then
        echo "Usage: archive <directory_or_file> [ex]"
        return 1
    fi

    local target="$1"
    local zipfile="${target%/}.zip"

    if [ "$2" = "ex" ]; then
        if [ -f "$target" ]; then
            unzip "$target" && echo "File '$target' has been unzipped."
        else
            echo "Error: Zip file '$target' does not exist."
            return 1
        fi
    elif [ -e "$target" ]; then
        zip -r "$zipfile" "$target" && echo "'$target' has been zipped into '$zipfile'."
    else
        echo "Error: '$target' does not exist."
        return 1

    fi
}

# Compress or extract a file or directory using tar and gz
tarchive() {
    if [ -z "$1" ]; then
        echo "Usage: tarchive <directory_or_file> [ex]"
        return 1
    fi

    local target="$1"
    local tarfile="${target%/}.tar.gz"

    if [ "$2" = "ex" ]; then
        if [ -f "$target" ]; then
            tar -xzvf "$target" && echo "Archive '$target' has been extracted."
        else
            echo "Error: Archive file '$target' does not exist."
            return 1
        fi
    elif [ -e "$target" ]; then
        tar -czvf "$tarfile" "$target" && echo "'$target' has been compressed into '$tarfile'."
    else
        echo "Error: '$target' does not exist."
        return 1
    fi
}

# Determine size of a file or total size of a directory
fs() {
    local arg="-sbh"

    if [[ "$#" -gt 0 ]]; then
        du $arg -- "$@"
    else
        du $arg -- .[^.]* ./* 2>/dev/null
    fi
}

# Lists the largest files under the specified directory.
# <directory> - Directory to search in (required)
# [count]     - Number of results to display (optional, default: 20)
largest-files() {
    if [[ -z "$1" ]]; then
        echo "Usage: $0 <directory> [count]"
        return
    fi

    DIR="$1"
    COUNT="${2:-20}"

    echo "Scanning $DIR for largest files..."
    sudo find "$DIR" -type f -printf '%s %p\n' 2>/dev/null |
        sort -nr |
        head -n "$COUNT" |
        awk '{ printf("%10d MB  %s\n", $1/1024/1024, $2) }'

}

# bat git diff
batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# bat highlighting --help messages
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

# Open a Docker container shell (default: bash, optional: sh)
dex() {
    local container=$1
    local shell=${2:-bash}
    docker exec -it "$container" "$shell"
}

# List all running Docker containers with their ports
dports() {
    docker ps --format '{{.Names}}: {{.Ports}}'
}

# List running Docker containers with only externally mapped ports
dmports() {
    docker ps --format '{{.Names}}: {{.Ports}}' | while IFS= read -r line; do
        container_name="${line%%:*}"
        ports="${line#*: }"
        if [[ "$ports" == *"->"* ]]; then
            echo "$container_name: $ports"
        fi
    done
}

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
lazy_load_nvm() {
    unset -f npm npx node nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

npm() {
    lazy_load_nvm
    npm $@
}

npx() {
    lazy_load_nvm
    npx $@
}

node() {
    lazy_load_nvm
    node $@
}

nvm() {
    lazy_load_nvm
    nvm $@
}

# Git
git-create() {
    git init
    git add --all
    git commit -m "Initial commit"
}

git-recreate() {
    rm -rf .git
    git-create
}

wip() {
    git add --all
    git commit -m "WIP"
}

# Change current working directory when exiting Yazi
y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
