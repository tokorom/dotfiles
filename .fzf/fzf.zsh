# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

FZFDIR=$HOME/.fzf/

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Sources
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

[ -f $FZFDIR/functions.zsh ] && source $FZFDIR/functions.zsh

# Key bindings
# ------------
bindkey '^F^F' fzf-file-widget
bindkey '^F^D' fzf-cd-widget
bindkey '^F^R' fzf-history-widget
bindkey '^R' fzf-history-widget

bindkey '^F^G' fzf-git-st
