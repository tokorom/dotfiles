" ==============================
" thinpl settings -----

let g:thinpl#git_clone_location = '~/develop/vim_plugins'

" ==============================
" plugins -----

let plugin = thinpl#add('w0ng/vim-hybrid')
" options {{{1
function! plugin.did_load() abort
  colorscheme hybrid
endfunction
" 1}}}

let plugin = thinpl#add('vim-scripts/autodate.vim')

let plugin = thinpl#add('vim-scripts/surround.vim')

let plugin = thinpl#add('kana/vim-fakeclip')

let plugin = thinpl#add('vim-scripts/L9')

let plugin = thinpl#add('kana/vim-altr')

let plugin = thinpl#add('kana/vim-smartinput')

let plugin = thinpl#add('kana/vim-textobj-user')
let plugin = thinpl#add('kana/vim-textobj-line')
let plugin = thinpl#add('kana/vim-textobj-entire')
let plugin = thinpl#add('kana/vim-textobj-indent')
let plugin = thinpl#add('kana/vim-textobj-function')
let plugin = thinpl#add('kana/vim-operator-user')
let plugin = thinpl#add('kana/vim-operator-replace')
let plugin = thinpl#add('emonkak/vim-operator-comment')

let plugin = thinpl#add('junegunn/vader.vim')

let plugin = thinpl#add('Shougo/context_filetype.vim')
let plugin = thinpl#add('tokorom/neosnippet.vim')
" vim-review settings {{{1
function! plugin.will_load() abort
  let g:neosnippet#disable_runtime_snippets = {'_': 1}
  let g:neosnippet#snippets_directory = $VIMHOME.'/snippets'
  let g:neosnippet#enable_snipmate_compatibility = 1

  imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)"
  \ : neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : pumvisible() ? "\<CR>"
  \ : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)"
  \ : neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : "\<TAB>"
  imap <expr><M-Y> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : ""
  smap <expr><M-Y> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : ""
  imap <expr><Esc> neosnippet#jumpable() ?
  \ "\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<Esc>" : "\<Esc>"
  smap <expr><Esc> neosnippet#jumpable() ?
  \ "\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<M-Y>\<Esc>" : "\<Esc>"
endfunction
" 1}}}

let plugin = thinpl#add('thinca/vim-quickrun')
" options {{{1
function! plugin.will_load() abort
  map [MyPrefix]q <Nop>
  map [MyPrefix]q <Plug>(quickrun)
endfunction
function! plugin.did_load() abort
  if !exists('g:quickrun_config')
    let g:quickrun_config = {}
  endif

  let g:quickrun_config['*'] = {'split': 'below'}

  let g:quickrun_config['markdown'] = {
    \ 'outputter' : 'null',
    \ 'command' : 'open',
    \ 'cmdopt' : '-a',
    \ 'args' : 'Marked\ 2',
    \ 'exec' : '%c %o %a %s',
    \ }
endfunction
" 1}}}

let plugin = thinpl#add('itchyny/lightline.vim')
" vim-review settings {{{1
function! plugin.will_load() abort
  let g:lightline = {'colorscheme': 'wombat'}
endfunction
" 1}}}

let plugin = thinpl#add('junegunn/fzf')
let plugin = thinpl#add('junegunn/fzf.vim')
" options {{{1
function! plugin.will_load() abort
  let g:fzf_command_prefix = 'Fzf'
  let g:fzf_layout = { 'up': '~40%' }

  nnoremap [MyPrefix].f :<C-u>FzfFiles<CR>
  nnoremap [MyPrefix].b :<C-u>FzfBuffers<CR>
  nnoremap [MyPrefix].r :<C-u>FzfHistory<CR>
  nnoremap [MyPrefix].l :<C-u>FzfLines<CR>
  nnoremap [MyPrefix].h :<C-u>FzfHelptags<CR>
  nnoremap [MyPrefix].s :<C-u>FzfFiles $VIMHOME/snippets/<CR>
  nnoremap [MyPrefix].p :<C-u>tabnew $VIMHOME/plugins.vim<CR>:<C-u>FzfLines<CR>
  nnoremap <expr> [MyPrefix].g ':FzfAg ' . expand('<cword>')
endfunction
" 1}}}

let plugin = thinpl#add('tokorom/tabnew-or-select.vim')
" vim-review settings {{{1
function! plugin.will_load() abort
  let g:fzf_action = {
    \ '':       'TabNewOrSelect',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
endfunction
" 1}}}

let plugin = thinpl#add('ale')
let plugin.filetype = ['vader', 'swift', 'review']
" options {{{1
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
" options {{{1
function! plugin.will_load() abort
  let g:completor_auto_trigger = 1
  let g:completor_auto_complete_min_chars = 5
  let g:completor_min_chars = 1
  inoremap <expr> <C-n> pumvisible() ? "<C-n>" : "<C-r>=completor#do('complete')<CR>"
endfunction
" 1}}}

let plugin = thinpl#add('maralla/completor-neosnippet')

let plugin = thinpl#add('completor-shell')

let plugin = thinpl#add('swift_vim')
" plugin.local_location = '~/swift/utils/vim'
let plugin.local_location = '~/develop/github/swift/utils/vim'

let plugin = thinpl#add('swift-dict.vim')
let plugin.filetype = ['swift']
" options {{{1
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

let plugin = thinpl#add('rakr/vim-one')
let plugin.filetype = ['review']
" options {{{1
function! plugin.did_load() abort
  set background=light
  let g:one_allow_italics = 1
  colorscheme one

  highlight Normal ctermfg=Black
endfunction
" 1}}}

let plugin = thinpl#add('tokorom/ale-prh-review')
let plugin.filetype = ['review', 'vader']

let plugin = thinpl#add('tpope/vim-fugitive')
let plugin = thinpl#add('sjl/gundo.vim')

let plugin = thinpl#add('airblade/vim-gitgutter')
let plugin.autocmd = ['BufWrite']
" options {{{1
function! plugin.did_load() abort
  call gitgutter#all(1)
endfunction
" 1}}}

let plugin = thinpl#add('cespare/vim-toml')

let plugin = thinpl#add('chrismetcalf/vim-markdown')

let plugin = thinpl#add('elzr/vim-json')

let plugin = thinpl#add('tokorom/urldecoder.vim')

let plugin = thinpl#add('rizzatti/dash.vim')
" vim-review settings {{{1
function! plugin.did_load() abort
  nnoremap <expr> [MyPrefix]h ':Dash ' . expand('<cword>')
endfunction
" 1}}}

" ==============================
" setup added plugins
call thinpl#setup_plugins()
