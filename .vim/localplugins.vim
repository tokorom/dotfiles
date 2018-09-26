" vim-review

let g:vim_review#include_filetypes = ['swift']
packadd vim-review

" swift-dict.vim

packadd swift-dict.vim
call swift_dict#configure_swift_dict_for_completor()

" completor.vim

let g:completor_auto_trigger = 1
let g:completor_auto_complete_min_chars = 5
let g:completor_min_chars = 1
inoremap <expr> <C-n> pumvisible() ? "<C-n>" : "<C-r>=completor#do('complete')<CR>"

packadd completor.vim


" swift

" packadd apple_swift_vim
packadd tokorom_swift_vim
