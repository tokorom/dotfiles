" vim-review

let g:vim_review#include_filetypes = ['swift']
packadd vim-review

packadd swift-dict.vim
call swift_dict#configure_swift_dict_for_completor()
