" Behaves just like C
runtime! ftplugin/cpp.vim

" ÉRÉìÉpÉCÉãê›íË
setlocal makeprg=nmake
setlocal errorformat=\"%f\"\\,\ line\ %l:\ Error:\ %m,\"%f\"\\,\ line\ %l:\ Serious\ error:\ %m,NMAKE\ :\ %m,\"%f\"\\,\ line\ %l:\ Warning:\ %m

" setting for Japanese
setlocal fileencodings=cp932,utf-8,euc-jp,iso-2022-jp,ucs-2,latin1
setlocal fileformats=dos,unix,mac

command! BrewCompile make %<.o 

nnoremap  <M-c><M-o>    <Esc>:w<CR>:BrewCompile<CR>
nnoremap  <Space>co     <Esc>:w<CR>:BrewCompile<CR>

"function! ShowWarningsForBrew() range
"    setlocal errorformat=\"%f\"\\,\ line\ %l:\ Warning:\ %m
"    make
"    setlocal errorformat=\"%f\"\\,\ line\ %l:\ Error:\ %m,\"%f\"\\,\ line\ %l:\ Serious\ error:\ %m,NMAKE\ :\ %m
"endfunction
"command! BrewWarning :call ShowWarningsForBrew()

