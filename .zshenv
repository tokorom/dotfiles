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

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

####### alias ########

alias g="git"
alias sc="screen -UxDR"
alias sed="gsed"
alias awk="gawk"
alias ls="ls -G"
alias ll="ls -la"

alias mvim='mvim -c "cd ${PWD}"'
alias mkcd='source ~/bin/mkcd'

alias tmux-changekey='tmux set-option -ag prefix C-b'
alias tmux-revertkey='tmux set-option -ag prefix C-t'

alias bi='bundle install'
alias be='bundle exec'

if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

####### RVM #########

if [ -s "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
  rvm use default 1.9.3 > /dev/null
fi


####### autojump #########

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

####### etc #########

# Disable ssh-agent
unset SSH_AUTH_SOCK

####### finally #########

export PATH=~/bin:$PATH

####### finally #########
#
[ -f ~/.zshenv.specific ] && source ~/.zshenv.specific
