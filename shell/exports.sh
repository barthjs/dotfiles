# Extra paths
export PATH=$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$PATH

export EDITOR="vim"

# fzf
export FZF_DEFAULT_COMMAND='fd --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Preview file content using bat
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
