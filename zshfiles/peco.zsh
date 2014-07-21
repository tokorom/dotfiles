# selecto-history

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="\tac"
    else
        tac="\tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        \peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# ll

function ll-peco() {
    SELECTED=$(\ls -la | \peco)
    EXTRACTED=$(\echo ${SELECTED} | sed -e "s/.*\s\(\S\+\)*$/\1/")
    eval \echo ${EXTRACTED}
    eval \echo ${EXTRACTED} | tr -d '\n' | \pbcopy
}
zle -N ll-peco
