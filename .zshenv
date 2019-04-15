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
    /usr/local/bin # brew
    /usr/bin # default
    /bin # default
    /usr/sbin # default
    /sbin # default
    ~/go/bin # go
    $path
  )
}

####### fpath #########

fpath=(
  ~/zsh/functions
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

alias bi='bundle install --path vendor/bundler'
alias be='bundle exec'

alias vim-buffer='tmux capture-pane -t 0 -S -32768; tmux show-buffer | vim - -c 32768'
alias vb='vim-buffer'

if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
elif [ -f ~/Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

CHROMEMACAPP=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
if [ -f $CHROMEMACAPP ]; then
  alias chrome='$CHROMEMACAPP'
fi

####### autojump #########

if type brew >/dev/null 2>&1; then
  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
fi

####### direnv #########

if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

####### java ########

if type /usr/libexec/java_home >/dev/null 2>&1; then
  export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
fi

####### etc #########

# Disable ssh-agent
#unset SSH_AUTH_SOCK
