#!/bin/bash

function bootstrapTerminal() {
    echo "Authenticating with sudo..."
    if ! sudo -v; then
        echo "Failed to authenticate with sudo. Exiting." >&2
        exit 1
    fi

    echo "Running installscript.sh"
    if source ~/.dotfiles/installscript.sh; then
        echo "Setup script completed successfully."
    else
        echo "Error: Setup script failed." >&2
        exit 1
    fi
}

echo 'Bootstrap terminal'
echo '------------------'
read -p 'This will reset your terminal. Are you sure you want to do this? (y/n) ' reply

if [[ "$reply" =~ ^[Yy]$ ]]; then
    bootstrapTerminal
else
    echo "Operation cancelled."
    exit 0
fi

echo '+++++++++++++++++++++++'
echo "Installation completed."
echo '+++++++++++++++++++++++'
exit 0
