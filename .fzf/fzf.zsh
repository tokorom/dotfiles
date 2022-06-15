# Setup fzf
# ---------

export FZFDIR=/opt/homebrew/Cellar/fzf/0.30.0

if [[ ! "$PATH" == *$FZFDIR/bin* ]]; then
  export PATH="$PATH:$FZFDIR/bin"
fi

FZFCONFIGDIR=$HOME/.fzf/

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZFDIR/shell/completion.zsh" 2> /dev/null

# Sources
# ------------
source "$FZFDIR/shell/key-bindings.zsh"

[ -f $FZFCONFIGDIR/functions.zsh ] && source $FZFCONFIGDIR/functions.zsh

# Key bindings
# ------------
bindkey '^J^J' fzf-file-special
bindkey '^J^D' fzf-cd-widget
bindkey '^J^R' fzf-history-widget
bindkey '^R' fzf-history-widget

bindkey '^J^H' fzf-lbuffer
bindkey '^J^G' fzf-git-st
