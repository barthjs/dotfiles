#!/bin/bash

# Hide "last login" line when starting a new terminal session
touch "$HOME"/.hushlogin

echo 'Installing Oh My Zsh'
echo '--------------------'
rm -rf "$HOME"/.oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

# Creating symlink for zsh preferences
rm "$HOME"/.zshrc
ln -s "$HOME"/.dotfiles/shell/zshrc "$HOME"/.zshrc

# Installing zsh plugins
echo 'Installing zsh-autosuggestions'
echo '------------------------------'
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo 'Installing zsh-syntax-highlighting'
echo '----------------------------------'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Adding global gitignore
git config --global core.excludesfile "$HOME"/.dotfiles/shell/.global-gitignore
