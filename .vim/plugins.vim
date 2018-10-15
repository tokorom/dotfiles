scriptencoding utf-8

" ==============================
" thinpl settings -----

let g:thinpl#git_clone_location = '~/develop/vim_plugins'

" ==============================
" plugins -----

let plugin = thinpl#add('w0ng/vim-hybrid')
" settings {{{1
function! plugin.did_load() abort
  colorscheme hybrid
endfunction
" 1}}}

let plugin = thinpl#add('vim-scripts/autodate.vim')

let plugin = thinpl#add('vim-scripts/surround.vim')

let plugin = thinpl#add('kana/vim-fakeclip')

let plugin = thinpl#add('vim-scripts/L9')

let plugin = thinpl#add('kana/vim-altr')

let plugin = thinpl#add('kana/vim-textobj-user')
let plugin = thinpl#add('kana/vim-textobj-indent')
let plugin = thinpl#add('kana/vim-textobj-function')
let plugin = thinpl#add('kana/vim-textobj-line')
" settings {{{1
function! plugin.will_load() abort
  omap l <Plug>(textobj-line-a)
endfunction
" 1}}}

let plugin = thinpl#add('kana/vim-operator-user')
let plugin = thinpl#add('emonkak/vim-operator-comment')
" settings {{{1
function! plugin.will_load() abort
  nmap [MyPrefix]x <Plug>(operator-comment)
  nmap [MyPrefix]z <Plug>(operator-uncomment)
  vmap [MyPrefix]x <Plug>(operator-comment)
  vmap [MyPrefix]z <Plug>(operator-uncomment)
  nmap [MyPrefix]xx <Plug>(operator-comment)l
  nmap [MyPrefix]zz <Plug>(operator-uncomment)l
endfunction
" 1}}}
let plugin = thinpl#add('kana/vim-operator-replace')
" settings {{{1
function! plugin.will_load() abort
  nmap [MyPrefix]r <Plug>(operator-replace)
  vmap [MyPrefix]r <Plug>(operator-replace)
  nmap [MyPrefix]rr <Plug>(operator-replace)iw
endfunction
" 1}}}

let plugin = thinpl#add('kana/vim-smartinput')
let plugin.filetype = ['vim', 'c', 'cpp', 'java', 'swift', 'ruby']
" settings {{{1
function! plugin.did_load() abort
  call smartinput#clear_rules()
  call smartinput#define_rule({'at': '{\%#', 'char': '<Enter>', 'input': '<Enter>}<Esc>O'})
endfunction
" 1}}}

let plugin = thinpl#add('junegunn/vader.vim')

let plugin = thinpl#add('SirVer/ultisnips')
" settings {{{1
function! plugin.will_load() abort
  let g:UltiSnipsSnippetDirectories=['snippets/usnippets', 'UltiSnips']
  let g:UltiSnipsExpandTrigger='<tab>'
  let g:UltiSnipsJumpForwardTrigger='<tab>'
  let g:UltiSnipsJumpBackwardTrigger='<c-b>'
endfunction
" 1}}}

let plugin = thinpl#add('thinca/vim-quickrun')
" settings {{{1
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
" settings {{{1
function! plugin.will_load() abort
  let g:lightline = {'colorscheme': 'wombat'}
endfunction
" 1}}}

let plugin = thinpl#add('junegunn/fzf')
let plugin = thinpl#add('junegunn/fzf.vim')
" settings {{{1
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
" settings {{{1
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
" settings {{{1
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
  \   'vim': ['vint'],
  \   'swift': ['swiftlint', 'swiftsyntaxcheck'],
  \   'review': ['redpen', 'prhreview'],
  \}
endfunction
" 1}}}

let plugin = thinpl#add('ale-swift-syntax-check')
let plugin.filetype = ['swift']

let plugin = thinpl#add('completor.vim')
" settings {{{1
function! plugin.will_load() abort
  let g:completor_auto_trigger = 1
  let g:completor_auto_complete_min_chars = 5
  let g:completor_min_chars = 1
  inoremap <expr> <C-n> pumvisible() ? "<C-n>" : "<C-r>=completor#do('complete')<CR>"
endfunction
" 1}}}

let plugin = thinpl#add('completor-shell')

let plugin = thinpl#add('swift_vim')
let plugin.repository = ''
" plugin.local_location = '~/swift/utils/vim'
let plugin.local_location = '~/develop/github/swift/utils/vim'

let plugin = thinpl#add('swift-dict.vim')
let plugin.filetype = ['swift']
" settings {{{1
function! plugin.did_load() abort
  call swift_dict#configure_swift_dict_for_completor()
endfunction
" 1}}}

let plugin = thinpl#add('swift-smart-move.vim')
let plugin.filetype = ['swift']

let plugin = thinpl#add('vim-review')
" settings {{{1
function! plugin.will_load() abort
  let g:vim_review#include_filetypes = ['swift']
endfunction
" 1}}}

let plugin = thinpl#add('rakr/vim-one')
let plugin.filetype = ['review']
" settings {{{1
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
let plugin.command = ['Gundo*']
" settings {{{1
function! plugin.prepare() abort
  execute 'command! GundoEnable call thinpl#load_plugin("' . self.name . '", "gundo plugin is loaded :)")'
endfunction
" 1}}}

let plugin = thinpl#add('airblade/vim-gitgutter')
let plugin.autocmd = ['BufWrite']
" settings {{{1
function! plugin.did_load() abort
  call gitgutter#all(1)
endfunction
" 1}}}

let plugin = thinpl#add('cespare/vim-toml')

let plugin = thinpl#add('chrismetcalf/vim-markdown')

let plugin = thinpl#add('elzr/vim-json')

let plugin = thinpl#add('tokorom/urldecoder.vim')

let plugin = thinpl#add('rizzatti/dash.vim')
" settings {{{1
function! plugin.did_load() abort
  nnoremap <expr> [MyPrefix]h ':Dash ' . expand('<cword>')
endfunction
" 1}}}

" ==============================
" setup added plugins
call thinpl#setup_plugins()
