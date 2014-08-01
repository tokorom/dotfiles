###############################
# .zshenv
###############################

####### export ########

export LANG=ja_JP.UTF-8
export MANPATH=/opt/local/man:$MANPATH 
export EDITOR=vim
export MAILCHECK=0

####### path #########

export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin/:~/bin/clang/:$PATH:~/local/bin:/Applications/android_sdk/tools/:/Applications/android_sdk/platform-tools:/Applications/UpTeX.app/teTeX/bin:/usr/local/share/npm/bin/

####### alias ########

alias g="git"
alias sc="screen -UxDR"
alias sed="gsed"
alias awk="gawk"
alias tac="gtac"
alias ls="ls -G"
alias ll="ls -la"

alias tigs="tig status"

alias mkcd='source ~/bin/mkcd'

alias tmux-changekey='tmux set-option -ag prefix C-b'
alias tmux-revertkey='tmux set-option -ag prefix C-t'

alias bi='bundle install --path vendor/bundler'
alias be='bundle exec'

alias vim-buffer='tmux capture-pane -t 0 -S -32768; tmux show-buffer | vim - -c 32768'
alias vb='vim-buffer'

alias swift='xcrun swift'

if [ -f ~/Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
elif [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

####### autojump #########

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

####### rbenv #########

eval "$(rbenv init -)"

####### etc #########

# Disable ssh-agent
#unset SSH_AUTH_SOCK

####### finally #########

[ -f ~/.zshenv.local ] && source ~/.zshenv.local
export PATH=~/bin:$PATH
