" override swift.vim

setlocal iskeyword-=?,!,@-@,#
setlocal completefunc=neocomplete#complete#manual_complete

" --- added keybinds ---

inoremap <buffer> <C-b> <Esc>F:a
inoremap <buffer> <C-f> <Esc>f:a
