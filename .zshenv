###############################
# .zshenv
###############################

####### export ########

export LANG=ja_JP.UTF-8
export PATH=~/bin/:/opt/local/bin:/opt/local/sbin/:~/bin/clang/:$PATH:~/local/bin:/Applications/android_sdk/tools/:/Applications/android_sdk/platform-tools
export MANPATH=/opt/local/man:$MANPATH 
export EDITOR=vim
export MAILCHECK=0

####### alias ########

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

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm use default 1.9.2-head > /dev/null

