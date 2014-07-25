# selecto-history
function peco-select-history() {
    local tac="tac"
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# ll
function ll-peco() {
    SELECTED=$(ls -la | peco)
    EXTRACTED=$(${SELECTED} | sed -e "s/.*\s\(\S\+\)*$/\1/")
    eval echo ${EXTRACTED}
    eval echo ${EXTRACTED} | tr -d '\n' | pbcopy
}
zle -N ll-peco

# vim-mru
function vim-mru() {
    local mru_path="~/.cache/neomru/file"
    SELECTED=$(eval more $mru_path | peco)
    eval vim ${SELECTED}
}
zle -N vim-mru
