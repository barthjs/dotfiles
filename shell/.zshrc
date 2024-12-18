ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

# Hide username in prompt
DEFAULT_USER=$(whoami)

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles
for file in ~/.dotfiles/shell/{exports.sh,aliases.sh,functions.sh}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# ~/.dotfiles-custom/shell/ can be used for custom settings
for file in ~/.dotfiles-custom/shell/{exports.sh,aliases.sh,functions.sh,.zshrc}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Other programs
eval "$(zoxide init zsh)"
