__fzf() {
  local cmd="${FZF_COMMAND:-"$(cmd-findfile)"}"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

__find-prune() {
  echo "\\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune"
}

cmd-findfile() {
  echo "command find -L ${FZF_FIND_TARGET:-.} \
    -mindepth 1 \
    $(__find-prune) \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print \
    2> /dev/null \
    "
}

cmd-finddir() {
  echo "command find -L ${FZF_FIND_TARGET:-.} \
    -mindepth 1 \
    $(__find-prune) \
    -o -type d -print \
    "
}

cmd-z() {
  echo "zoxide query -l"
}

fzf-file-special() {
  local lbuf="${LBUFFER}"
  _fzf_complete -- "$@" < <(
    zoxide query -l
    eval "$(cmd-z)"
    eval "$(cmd-finddir)"
  )
  local selected="${LBUFFER}"
  if [ "${selected}" = "${lbuf}" ]; then
    LBUFFER="${lbuf}"
  else
    LBUFFER="${lbuf}${selected}"
  fi
  zle redisplay
}
zle -N fzf-file-special

# fgst - pick files from `git status -s` 
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-lbuffer() {
  local cmd="${LBUFFER}"
  LBUFFER="$(FZF_COMMAND="${cmd}" __fzf)"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle -N fzf-lbuffer

fgst() {
  # "Nothing to see here, move along"
  is_in_git_repo || return

  local cmd="command git status -s"

  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m "$@" | while read -r item; do
    local selected=$(printf '%q ' "$item" | cut -d " " -f 2)
    echo -n "${selected} "
  done
}

fzf-git-st() {
  LBUFFER="${LBUFFER} $(fgst)"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle -N fzf-git-st
