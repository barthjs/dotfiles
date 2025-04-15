# Extra paths
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export EDITOR="vim"

# fzf
export FZF_DEFAULT_COMMAND='fd --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Preview file content using bat
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Composer bin
export PATH=$HOME/.config/composer/vendor/bin/:$PATH

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
