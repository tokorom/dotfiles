" functions and commands 

" 行頭移動の自動制御版
function! MoveToZero()
    let beforeCol = col(".")
    execute "normal!^"
    let afterCol = col(".")
    if beforeCol == afterCol
        execute "normal!0"
    endif
endfunction
command! MoveToZero :call MoveToZero()

" source % の実行
command! SU :source %

" 開発中pluginの再読込
command! ReloadThisPlugin execute("unlet g:loaded_".expand("%:t:r")) | execute("source ".expand("%"))
command! RT ReloadThisPlugin

" ctagsの実行（スクリプト名固定）
command! Ctags :!./maketags.sh

" カレントバッファのファイル名を変更 by vim-users.jp
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" FireFoxで開く
if has('win32') || has('win64')
"    if @%[0] != 'c'
        command! FireFox :silent !start firefox c:%<CR>
"    else
"        command! FireFox :silent !start firefox %<CR>
"    endif
else
    command! FireFox :silent !start firefox %<CR>
endif

" snipMate再読み込み snipMateへのカスタマイズ前提 
command! ReloadAllSnippets :call ReloadAllSnippets()

