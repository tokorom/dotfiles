# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

bindkey '^F^F' fzf-file-widget
bindkey '^F^D' fzf-cd-widget
bindkey '^F^R' fzf-history-widget
bindkey '^R' fzf-history-widget

