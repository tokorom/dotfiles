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
    ~/.rbenv/shims # rbenv
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

####### envs ########

export CLICOLOR=1

####### alias ########

alias g="git"
alias sed="gsed"
alias awk="gawk"
alias tac="gtac"
alias ll="ls -la"

alias tigs="tig status"
alias gitdiff='git difftool --tool=vimdiff --no-prompt'

alias bi='bundle install'
alias be='bundle exec'

alias vim-buffer='tmux capture-pane -t 0 -S -32768; tmux show-buffer | vim - -c 32768'
alias vb='vim-buffer'

####### functions ########

mkcd() {
  mkdir -p $1
  cd $_
  pwd
}

tt() {
  if tmux ls > /dev/null 2>&1 ; then
    tmux attach
  else
    tmux
  fi
}

clear_backups() {
  cd ~

  ls backup/*.*
  ls backup/.*
  ls backup/*~
  ls .viminf *.tmp

  rm backup/*.*
  rm backup/.*
  rm backup/*~
  rm .viminf *.tmp
}

####### direnv #########

if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

####### secrets #########

[ -f ~/secrets/secrets.zsh ] && source ~/secrets/secrets.zsh
