" ==============================
" thinpl settings -----

let g:thinpl#git_clone_location = '~/develop/vim_plugins'

" ==============================
" plugins -----

let plugin = thinpl#add('ale')
let plugin.filetype = ['vader', 'swift', 'review']
" ale options {{{1
function! plugin.will_load() abort
  " 保存した時にチェック
  let g:ale_lint_on_save = 1
  " テキスト変更時にはチェックしない
  let g:ale_lint_on_text_changed = 0
  " ファイルオープン時にチェックしない
  let g:ale_lint_on_enter = 0
  " エラーがあればlistを自動で開く
  let g:ale_open_list = 1
  " QuickFixを使う
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1

  let g:ale_fixers = {
  \   'swift': ['swiftlint', 'swiftsyntaxcheck'],
  \   'review': ['redpen', 'prhreview'],
  \}
endfunction
" 1}}}

let plugin = thinpl#add('ale-swift-syntax-check')
let plugin.filetype = ['swift']

let plugin = thinpl#add('completor.vim')
" completor.vim options {{{1
function! plugin.will_load() abort
  let g:completor_auto_trigger = 1
  let g:completor_auto_complete_min_chars = 5
  let g:completor_min_chars = 1
  inoremap <expr> <C-n> pumvisible() ? "<C-n>" : "<C-r>=completor#do('complete')<CR>"
endfunction
" 1}}}

call thinpl#add('completor-shell')

let plugin = thinpl#add('swift_vim')
" plugin.local_location = '~/swift/utils/vim'
let plugin.local_location = '~/develop/github/swift/utils/vim'

let plugin = thinpl#add('swift-dict.vim')
let plugin.filetype = ['swift']
" swift-dict.vim options {{{1
function! plugin.did_load() abort
  call swift_dict#configure_swift_dict_for_completor()
endfunction
" 1}}}

let plugin = thinpl#add('swift-smart-move.vim')
let plugin.filetype = ['swift']

let plugin = thinpl#add('vim-review')
" vim-review settings {{{1
function! plugin.will_load() abort
  let g:vim_review#include_filetypes = ['swift']
endfunction
" 1}}}

let plugin = thinpl#add('airblade/vim-gitgutter')

" ==============================
" setup added plugins
call thinpl#setup_plugins()
