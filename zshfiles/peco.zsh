# selecto-history
function peco-select-history() {
  local tac="tac"
  BUFFER=$(history -n 1 | \
    eval $tac | \
    awk '!a[$0]++' | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# ll
function ll-peco() {
  local SELECTED=$(ls -la | peco --query "$1" | sed -e "s/.*\s\(\S\+\)*$/\1/")
  if [ 0 -ne ${#SELECTED} ]; then
    eval echo $SELECTED
    eval echo $SELECTED | tr -d '\n' | pbcopy
  fi
}
zle -N ll-peco
alias lll="ll-peco"

# vim-mru
function vim-mru() {
  local mru_path="~/.cache/neomru/file"
  local SELECTED=$(eval more $mru_path | peco --query "$1")
  if [ 0 -ne ${#SELECTED} ]; then
    eval vim $SELECTED
  fi
}
zle -N vim-mru
alias vr="vim-mru"

# autojump
function autojump-peco() {
  local cd_history_path="~/.local/share/autojump/autojump.txt"
  local SELECTED=$(eval more $cd_history_path | awk '!a[$0]++' | peco --query "$1" | cut -f2)
  if [ 0 -ne ${#SELECTED} ]; then
    eval echo "cd $SELECTED"
    eval cd $SELECTED
  fi
}
zle -N autojump-peco
alias jj="autojump-peco"

# cd-peco
function cd-peco() {
  local SELECTED=$(ls -F | grep / | peco --query "$1")
  if [ 0 -ne ${#SELECTED} ]; then
    eval cd $SELECTED
  fi
}
zle -N cd-peco
alias cdd="cd-peco"

# git-add-peco
function gitadd-peco() {
  local SELECTED="$(git status --porcelain | \
                    peco --query "$LBUFFER" | \
                    awk -F ' ' '{print $NF}')"
  local SELECTED=$(echo $SELECTED | tr '\n' ' ')
  if [ 0 -ne ${#SELECTED} ]; then
    eval git add $SELECTED
  fi
}
zle -N gitadd-peco
alias gadd="gitadd-peco"
