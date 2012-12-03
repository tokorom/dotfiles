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
alias ls="ls -G"
alias ll="ls -la"

alias svndel="svn st | grep '^!' | sed -e 's/\![ ]*/svn del /g' | sh"
alias svnadd="svn st | grep '^?' | sed -e 's/\?[ ]*/svn add /g' | sh"
alias svncommit='svn commit -m ""'

alias clang-scan-build="/usr/local/lib/checker-0.186/scan-build -o ./check_result xcodebuild -alltargets"
alias mvim='mvim -c "cd ${PWD}"'
alias mkcd='source ~/bin/mkcd'

alias tmux-changekey='tmux set-option -ag prefix C-b'
alias tmux-revertkey='tmux set-option -ag prefix C-t'

alias bi='bundle install'
alias be='bundle exec'

####### RVM #########

if [ -s "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
  rvm use default 1.9.2 > /dev/null
fi


####### autojump #########

if [ -x /usr/local/bin/brew ]; then
  if [ -f `brew --prefix`/etc/autojump ]; then
    . `brew --prefix`/etc/autojump
  fi
fi

####### etc #########

# Disable ssh-agent
unset SSH_AUTH_SOCK

####### finally #########

export PATH=~/bin:$PATH

####### finally #########
#
[ -f ~/.zshenv.specific ] && source ~/.zshenv.specific
