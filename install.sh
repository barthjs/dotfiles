#!/bin/bash

FORCE=false
if [[ "$1" == "--force" || "$1" == "-f" ]]; then
    FORCE=true
fi

# If --force or -f is not passed, ask for confirmation
if [[ "$FORCE" == false ]]; then
    echo 'This script will reset your terminal configuration.'
    echo 'Ensure you have backups of your .zshrc and other relevant files before proceeding.'
    read -p 'Are you sure you want to do this? (y/N) ' reply
    if [[ ! "$reply" =~ ^[Yy]$ ]]; then
        echo "Operation cancelled."
        exit 1
    fi
fi

echo '----------------------'
echo 'Installing dotfiles...'
echo '----------------------'

echo 'Installing Oh My Zsh'
echo '--------------------'
rm -rf "$HOME"/.oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

# Create symlink for zsh preferences
rm "$HOME"/.zshrc
ln -s "$HOME"/.dotfiles/shell/zshrc "$HOME"/.zshrc

# Zsh plugins
echo 'Installing zsh-autosuggestions'
echo '------------------------------'
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo 'Installing zsh-syntax-highlighting'
echo '----------------------------------'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Add global gitignore
git config --global core.excludesfile "$HOME"/.dotfiles/shell/global-gitignore

echo '+++++++++++++++++++++++'
echo "Installation completed."
echo '+++++++++++++++++++++++'
exit 0
