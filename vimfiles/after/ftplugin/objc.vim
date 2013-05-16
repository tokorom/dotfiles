"シフト移動幅
set shiftwidth=2
"ファイル内の <Tab> が対応する空白の数
set tabstop=2

" --- altr settings ---

call altr#remove_all()
call altr#define('%.h', '%.m', '%.mm')
call altr#define('en.lproj/%', 'ja.lproj/%')

" --- clang_complete settings ---

let g:clang_auto_user_options = 'path, .clang_complete, ios'

" --- added keybinds ---

nnoremap <buffer> [MyPrefix]{             o{<Esc>o}<Esc>
nnoremap <buffer> [MyDoublePrefix]{       $xo{<Esc>o}<Esc>

nnoremap <buffer> [MyPrefix][   ebi[<Esc>ea<Space>]<Esc>i
nnoremap <buffer> [MyPrefix]]   F[i[<Esc>f]a]<Esc>i<Space>
nnoremap <buffer> [MyPrefix]@   ebi@"<Esc>ea"<Esc>
nnoremap <buffer> [MyPrefix];   A;<Return>

inoremap <buffer> <C-a> <Esc>0f:a
inoremap <buffer> <C-b> <Esc>F:a
inoremap <buffer> <C-f> <Esc>f:a
inoremap <buffer> <C-]> <Esc>F[i[<Esc>A<Space>

map <silent> <buffer> <expr> [MyDoublePrefix]q ':QuickRun -args "TEST=' . expand("%:t:r") . '"<CR>'

if filereadable(expand('~/vimfiles/after/ftplugin/objc.vim.local'))
  source ~/vimfiles/after/ftplugin/objc.vim.local
endif
