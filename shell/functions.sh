# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

# Zip or unzip a file or directory
function archive() {
    if [ -z "$1" ]; then
        echo "Usage: archive <directory_or_file> [ex]"
        return 1
    fi

    local target="$1"
    local zipfile="${target%/}.zip"

    if [ "$2" = "ex" ]; then
        if [ -f "$target" ]; then
            unzip "$target"
            echo "File '$target' has been unzipped."
        else
            echo "Error: Zip file '$target' does not exist."
            return 1
        fi
    else
        if [ -d "$target" ]; then
            zip -r "$zipfile" "$target"
            echo "Directory '$target' has been zipped into '$zipfile'."
        elif [ -f "$target" ]; then
            zip "$zipfile" "$target"
            echo "File '$target' has been zipped into '$zipfile'."
        else
            echo "Error: '$target' does not exist."
            return 1
        fi
    fi
}

# Compress or extract a file or directory using tar and gz
function tarchive() {
    if [ -z "$1" ]; then
        echo "Usage: tarchive <directory_or_file> [ex]"
        return 1
    fi

    local target="$1"
    local tarfile="${target%/}.tar.gz"

    if [ "$2" = "ex" ]; then
        if [ -f "$target" ]; then
            tar -xzf "$target"
            echo "Archive '$target' has been extracted."
        else
            echo "Error: Archive file '$target' does not exist."
            return 1
        fi
    else
        if [ -d "$target" ]; then
            tar -czf "$tarfile" "$target"
            echo "Directory '$target' has been compressed into '$tarfile'."
        elif [ -f "$target" ]; then
            tar -czf "$tarfile" "$target"
            echo "File '$target' has been compressed into '$tarfile'."
        else
            echo "Error: '$target' does not exist."
            return 1
        fi
    fi
}

# Determine size of a file or total size of a directory
function fs() {
    local arg="-sbh"

    if [[ "$#" -gt 0 ]]; then
        du $arg -- "$@"
    else
        du $arg -- .[^.]* ./* 2>/dev/null
    fi
}

# Normalize 'open' across Linux and Windows.
if grep -q WSL2 /proc/version; then
    # Ubuntu on Windows using WSL2
    alias open='explorer.exe'
else
    alias open='xdg-open'
fi

# 'o' with no arguments opens the current directory, otherwise opens the given location
function o() {
    if [ $# -eq 0 ]; then
        open .
    else
        open "$@"
    fi
}

# Open a shell in a docker container
function docker-ex() {
    docker exec -it "$@" bash
}

# List docker containers with mapped ports
function docker-ports() {
    docker ps --format '{{.Names}}: {{.Ports}}' | grep -v '\[\]' | while IFS= read -r line; do
        container_name="${line%%:*}"
        ports="${line#*: }"
        echo "$container_name: $ports"
    done
}

# Open a url
function browse() {
    url="https://$@"
    open "$url"
}

# Show the weather for a given city
function weather() {
    local city="${1:-Stuttgart}"
    curl https://wttr.in/${city// /+}\?F
}