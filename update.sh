#!/bin/bash

ZSH=$HOME/.oh-my-zsh

$ZSH/tools/upgrade.sh

echo "Updating zsh-autosuggestions plugin..."
git -C "$ZSH/custom/plugins/zsh-autosuggestions" pull

echo "Updating zsh-syntax-highlighting plugin..."
git -C "$ZSH/custom/plugins/zsh-syntax-highlighting" pull

echo "Updating dotfiles repository..."
git -C "$HOME/.dotfiles" pull

echo "Update complete"
