###############################
# .zshenv
###############################

####### export ########

export LANG=ja_JP.UTF-8
export MANPATH=/opt/local/man:$MANPATH 
export EDITOR=vim
export MAILCHECK=0

####### path #########

setopt no_global_rcs

path_setting() {
  path=(
    ~/bin # mine
    /usr/local/bin # brew for Intel
    /opt/homebrew/bin # brew for ARM
    /usr/bin # default
    /bin # default
    /usr/sbin # default
    /sbin # default
    ~/.nodebrew/current/bin # nodebrew
    ~/go/bin # go
    ~/.cargo/bin # rust
    /usr/local/flutter/bin # Flutter
    $path
  )
}

####### fpath #########

fpath=(
  ~/.zsh/functions
  ~/.zsh/completion
  $fpath
)

####### alias ########

alias g="git"
alias sc="screen -UxDR"
alias sed="gsed"
alias awk="gawk"
alias tac="gtac"
alias ls="ls -G"
alias ll="ls -la"

alias tigs="tig status"
alias gitdiff='git difftool --tool=vimdiff --no-prompt'

alias mkcd='source ~/bin/mkcd'

alias tmux-changekey='tmux set-option -ag prefix C-b'
alias tmux-revertkey='tmux set-option -ag prefix C-t'

alias bi='bundle install'
alias be='bundle exec'

alias vim-buffer='tmux capture-pane -t 0 -S -32768; tmux show-buffer | vim - -c 32768'
alias vb='vim-buffer'

CHROMEMACAPP=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
if [ -f $CHROMEMACAPP ]; then
  alias chrome='$CHROMEMACAPP'
fi

####### direnv #########

if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

####### secrets #########

[ -f ~/secrets/secrets.zsh ] && source ~/secrets/secrets.zsh
