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
