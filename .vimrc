" ########## vimrc ##########

autocmd!

set nocompatible
filetype off

let $VIMHOME = $HOME."/.vim"
let $VIMLOCAL = $HOME."/.vim.local"

"=============================================================================
" Plugins (vim-plug) {{{1

if has('vim_starting')
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif
endif

call plug#begin('~/.vim/plugged')

Plug 'autodate.vim'
Plug 'surround.vim'
Plug 'kana/vim-fakeclip'
Plug 'L9'
Plug 'kana/vim-altr'
Plug 'thinca/vim-ref'
Plug 'anekos/char-counter-vim'
Plug 'kana/vim-smartinput'
Plug 'thinca/vim-tabrecent'

Plug 'sjl/gundo.vim', {'on': ['GundoShow', 'GundoHide', 'GundoToggle', 'GundoRenderGraph']}

" color
Plug 'w0ng/vim-hybrid'

" status line
Plug 'itchyny/lightline.vim'

" operator
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'emonkak/vim-operator-comment'

" textobj
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function'

" ag
Plug 'rking/ag.vim', {'on': ['Ag']}

" unite
Plug 'Shougo/unite.vim', {'on': ['UniteWithCursorWord', 'UniteWithInput']}
Plug 'Shougo/neomru.vim', {'on': []}
Plug '$VIMLOCAL/unite-action-tabselect', {'on': []}

" neocomplete
Plug 'Shougo/neocomplete.vim'

" neosnippet
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Codic
Plug 'koron/codic-vim', {'on': 'Codic'}
Plug 'rhysd/unite-codic.vim', {'on' :[]}

" syntax check
Plug 'scrooloose/syntastic'
Plug 'tokorom/syntastic-swiftlint.vim', {'for': ['swift']}

" git
Plug 'tpope/vim-fugitive', {'on': ['Gblame', 'Gstatus']}
Plug 'gregsexton/gitv', {'on': 'GitV'}

" ruby
Plug 'tpope/vim-rails', {'for': ['ruby']}

" markdown
Plug 'chrismetcalf/vim-markdown', {'for': ['markdown']}

" swift
Plug 'apple/swift', {'for': ['swift'], 'rtp': 'utils/vim'}
Plug 'tokorom/swift_gyb.vim', {'for': ['swift']}
Plug 'tokorom/swift-dict.vim', {'for': ['swift']}

" json
Plug 'https://github.com/elzr/vim-json.git', {'filetypes': ['json']}

" html
Plug 'slim-template/vim-slim', {'for': ['slim']}

" quickrun
Plug 'thinca/vim-quickrun'

call plug#end()

" ファイルタイプ別セッティングON
filetype plugin indent on 

" plugin utils {{{2
function! LoadAndExecPlugin(cmd, ...)
  if !empty(a:000)
    call call('plug#load', a:000)
  endif
  execute a:cmd
endfunction
" }}}2

" }}}1

"=============================================================================
" 基本設定 {{{1

" 日本語入力設定
set imsearch=0
set iminsert=0
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-2,latin1
set fileformats=unix,mac,dos
set ambiwidth=double

" 挿入モードでのバックスペースの挙動設定
set backspace=indent,eol,start

" カラースキーマを設定
set t_Co=256
set background=dark
colorscheme hybrid
" hilight
syntax on
" 行番号を表示する
set number
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" 不可視文字を表示
set list
set lcs=tab:>\ 

" 新しい行のインデントを現在行と同じにする
set autoindent
" タブの代わりに空白文字を挿入する
set expandtab
" シフト移動幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" ファイル内の <Tab> が対応する空白の数
set tabstop=2
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 自動改行しない
set textwidth=0

" スワップファイル＆バックアップファイルを作るディレクトリ
set backupdir=$HOME/backup
set directory=$HOME/backup
" ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"インクリメンタルサーチを行う
set incsearch
"マッチした文字列をハイライト
set hlsearch
"検索時に大文字を含んでいたら大/小を区別
set ignorecase smartcase

" vimgrep時に自動でQuickFixを開く設定
autocmd QuickfixCmdPost vimgrep cw

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 日本語の行の連結時には空白を入力しない。
set formatoptions+=mM

" 画面最後の行をできる限り表示する。
set display+=lastline

" 補完の設定
set complete+=k
set completeopt=menu,preview,longest

" 日付の自動入力のフォーマット
let autodate_format='%Y-%m-%d'
let autodate_keyword_pre='Last Modified:'

" 折り畳み設定
set foldmethod=marker

" クリップボードを自動で利用 
set clipboard=unnamed

" undoファイル用のディレクトリを設定
set undodir=$HOME/vim_undo

" cursorline
set cursorline
highlight clear CursorLine
highlight CursorLine ctermbg=black guibg=black

" }}}1

"=============================================================================
" keybindings {{{1

" ---------- general ----------

noremap [MyPrefix] <Nop>
map <Space> [MyPrefix]
noremap [DoublePrefix] <Nop>
map <Space><Space> [DoublePrefix]

set winaltkeys=no
inoremap  <C-l>   <Esc>
nnoremap  [MyPrefix]l   :<C-u>TabRecent<CR>
nnoremap  <Space><Space><Space> :<C-u>TabRecent<CR>

" ---------- for MacVim ----------

nnoremap <S-C>   c$

" ---------- move ----------

noremap  <silent> <C-a>    <Esc>:<C-u>MoveToZero<CR>
noremap  <silent> <C-e>    $
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap J 5gj
noremap K 5gk

" ---------- insert mode ----------

inoremap <C-d>     <Delete>

" ---------- visual mode ----------

nnoremap gc   '[v']
vnoremap gc   :<C-u>normal gc<CR>
onoremap gc   :<C-u>normal gc<CR>

" ---------- command mode ----------

cnoremap <C-f>    <Right>
cnoremap <C-b>    <Left>
cnoremap <C-a>    <Home>
cnoremap <C-e>    <End>
cnoremap <C-d>    <Del>
cnoremap <C-h>    <BackSpace>

" -- exchange source <--> header --

nmap [MyPrefix]a             <Plug>(altr-forward)
nmap [MyPrefix]A             <Plug>(altr-back)

" ---------- quick-fix ----------

nnoremap [MyPrefix]cm            :<C-u>w<CR>:<C-u>make<CR>
nnoremap [MyPrefix]cf            :<C-u>cfile .build/errors.txt<CR>
nnoremap [MyPrefix]cl            :<C-u>clist<CR>
nnoremap [MyPrefix]co            :<C-u>copen<CR>
nnoremap [MyPrefix]cc            :<C-u>cc<CR>
nnoremap [MyPrefix]cn            :<C-u>cn<CR>
nnoremap [MyPrefix]cp            :<C-u>cp<CR>

" ---------- original ----------

nnoremap [MyPrefix].  <Nop>
nnoremap [MyPrefix].. :<C-u>edit %:h<CR>
nnoremap [MyPrefix].v :<C-u>edit $MYVIMRC<CR>
nnoremap [MyPrefix].p :<C-u>edit $VIMHOME/snippets/<CR>

" ---------- file ----------

nnoremap [MyPrefix]w             :<C-u>w<CR>
nnoremap [MyPrefix].e            :<C-u>e .<CR>

" ---------- tab ----------

nnoremap [MyPrefix]t             :<C-u>tabnew 
nnoremap <C-n>                   :<C-u>tabn<CR>
nnoremap <C-p>                   :<C-u>tabp<CR>

" ---------- unite ----------

nnoremap [MyPrefix].f :<C-u>Unite -start-insert buffer file_rec file/new<CR>
nnoremap [MyPrefix].b :<C-u>Unite -start-insert buffer<CR>
nnoremap [MyPrefix].f :<C-u>call LoadAndExecPlugin(':Unite -start-insert file_mru', 'neomru.vim', 'unite.vim', 'unite-action-tabselect')<CR>
nnoremap [MyPrefix].c :<C-u>call LoadAndExecPlugin(':Unite -start-insert codic', 'unite-codic.vim', 'codic-vim', 'unite.vim')<CR>
nnoremap <expr> [MyPrefix].g ':Unite grep:. -input=' . expand('<cword>')

" ---------- buffer ----------

nnoremap [MyPrefix]j       :<C-u>bn<CR>
nnoremap [MyPrefix]k       :<C-u>bp<CR>

" ---------- operator ----------

nmap [MyPrefix]r <Plug>(operator-replace)
vmap [MyPrefix]r <Plug>(operator-replace)
nmap [MyPrefix]rr <Plug>(operator-replace)iw

nmap [MyPrefix]x <Plug>(operator-comment)
nmap [MyPrefix]z <Plug>(operator-uncomment)
vmap [MyPrefix]x <Plug>(operator-comment)
vmap [MyPrefix]z <Plug>(operator-uncomment)
nmap [MyPrefix]xx <Plug>(operator-comment)l
nmap [MyPrefix]zz <Plug>(operator-uncomment)l

" ---------- textobj ----------

omap l <Plug>(textobj-line-a)

" }}}1

"=============================================================================
" my functions {{{1

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

" 現在のコードをGitHubで開く
command! -nargs=* -range GitBrowseRemote !git browse-remote --rev -L<line1>,<line2> <f-args> -- %

" }}}1

"=============================================================================
" autocmds {{{1

augroup VimrcAutocmds
  autocmd!
  " CdCurrent
  autocmd VimEnter * cd %:p:h
augroup END

" }}}1

"=============================================================================
" add file types {{{1

augroup AddFileType
  autocmd!
  " vim
  autocmd BufWinEnter,BufNewFile *.vimperatorrc setfiletype vim
  " rspec
  autocmd BufWinEnter,BufNewFile *_spec.rb setfiletype ruby.rspec
  " puthon.test
  autocmd BufWinEnter,BufNewFile test*.py setfiletype python.test
  " markdown
  autocmd BufWinEnter,BufNewFile *.md,*.mkd,*.page setfiletype markdown
  " iOS
  autocmd BufWinEnter,BufNewFile Podfile,*.podspec setfiletype ruby
  " slim
  autocmd BufWinEnter,BufNewFile *.slim,*.html.slim setfiletype slim
augroup END

" }}}1

"=============================================================================
" plugin settings {{{1

" lightline {{{2
"-----------------------------------------------------------------------------

let g:lightline = {'colorscheme': 'wombat'}

"-----------------------------------------------------------------------------
" }}}2

" vim-smartinput {{{2

call smartinput#clear_rules()
call smartinput#define_rule({
  \ 'at': '{\%#',
  \ 'char': '<Enter>',
  \ 'input': '<Enter>}<Esc>O',
  \ 'filetype': ['c', 'cpp', 'objc', 'swift'],
  \ })

" }}}2

" unite.vim {{{2
function! Loaded_unite()

let g:unite_update_time = 50

call unite#custom#default_action('jump_list,file,buffer,openable', 'tabselect')
call unite#custom#default_action('source/outline/*', 'choose')

call unite#custom_source('file_rec', 'ignore_pattern', '\%(^\|/\)\%(build\|te?mp\)/\|\.\%(build\|git\)/\|\.\%(DS_Store\|o\|exe\|dll\|bak\|sw[po]\|class\|d\|dia\|gcda\|gcno\|png\|gif\|jpe?g\)$')

" use `ag` for grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--smart-case --nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 0
endif

" close preview window
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  nnoremap <silent><buffer><expr> c
        \ empty(filter(range(1, winnr('$')),
        \ 'getwinvar(v:val, "&previewwindow") != 0')) ?
        \ unite#do_action('preview') : ":\<C-u>pclose!\<CR>"
  nmap <silent><buffer> <Esc> <Plug>(unite_exit)
  nmap <silent><buffer> / i<Space>
  nmap <silent><buffer> <C-n> j
  nmap <silent><buffer> <C-p> k
  imap <silent><buffer> <C-l> <Esc>q
endfunction

" custom filters
let s:filters = {
    \   "name" : "converter_filepath_filename",
    \   "description" : "filepath to filename"
\}

function! s:filters.filter(candidates, context)
    for candidate in a:candidates
      let items = split(candidate.word, ':')
      let items[0] = fnamemodify(items[0], ':t')
      let candidate.word = join(items, ':')
    endfor
    return a:candidates
endfunction

call unite#define_filter(s:filters)
unlet s:filters

call unite#custom#source('grep', 'converters', ["converter_filepath_filename"])

endfunction
command! LoadedUnite :call Loaded_unite()
" }}}2

" neocomplete {{{2
"-----------------------------------------------------------------------------

" {{{ initialize
let g:neocomplete#enable_at_startup = 1 "自動起動
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : neocomplete#start_manual_complete()
inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <C-g> neocomplete#undo_completion()
imap <C-k> <Plug>(neocomplete_start_unite_complete)<Esc>A

let g:swift_dict_with_neocomplete = 1 "siwft-dictをneocomplete経由で利用する
" }}}

" if neobundle#tap('neocomplete.vim') " {{{3
" function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

let g:neocomplete#disable_auto_complete = 1 "自動補完をしない
let g:neocomplete#auto_completion_start_length = 3 "自動補完開始は3文字打鍵した後
let g:neocomplete#enable_smart_case = 1 "大文字小文字無視
let g:neocomplete#max_list = 10000 "候補の最大数
let g:neocomplete#enable_auto_select = 0 "第一候補を自動選択しない
let g:neocomplete#enable_fuzzy_completion = 0 "Fuzzy補完しない

autocmd FileType vim,swift let g:neocomplete#disable_auto_complete = 0 "一部のfiletypeでは自動補完を有効にする

let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : ''
\ }

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

"-----------------------------------------------------------------------------
" endfunction " {{{3
" call neobundle#untap()
" endif " }}}3
" }}}2

" neosnippet {{{2
" if neobundle#tap('neosnippet') " {{{3
" function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

let g:neosnippet#snippets_directory = "$VIMHOME/snippets"
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

"-----------------------------------------------------------------------------
" endfunction " {{{3
" call neobundle#untap()
" endif " }}}3
" }}}2

" vim-quickrun {{{2
" if neobundle#tap('vim-quickrun') " {{{3
" function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

" initialize

let g:quickrun_config = {}

" config

let g:quickrun_config['*'] = {'split': 'below'}

let g:quickrun_config['markdown'] = {
  \ 'outputter' : 'null',
  \ 'command' : 'open',
  \ 'cmdopt' : '-a',
  \ 'args' : 'Marked\ 2',
  \ 'exec' : '%c %o %a %s',
  \ }

" keymap

map [MyPrefix]q <Nop>
map [MyPrefix]q <Plug>(quickrun)

"-----------------------------------------------------------------------------
" endfunction " {{{3
" call neobundle#untap()
" endif " }}}3
" }}}2

" syntastic {{{2
" if neobundle#tap('syntastic') " {{{3
" function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_swift_checkers = ['swiftlint']
let g:syntastic_slim_checkers = ['slim_lint']
let g:syntastic_ruby_checkers = ['rubocop']

"-----------------------------------------------------------------------------
" endfunction " {{{3
" call neobundle#untap()
" endif " }}}3
" }}}2

call plug#load('vim-hybrid')

" }}}1
