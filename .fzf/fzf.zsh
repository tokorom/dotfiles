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
bindkey '^J^J' fzf-file-special
bindkey '^J^D' fzf-cd-widget
bindkey '^J^R' fzf-history-widget
bindkey '^R' fzf-history-widget

bindkey '^J^L' fzf-lbuffer
bindkey '^J^G' fzf-git-st
