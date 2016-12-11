" ########## vimrc ##########

autocmd!

set nocompatible
filetype off

"=============================================================================
" Bundle (NeoBundle) {{{1

if has('vim_starting')
  set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim/
endif

call neobundle#begin(expand('$HOME/vimfiles/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }

NeoBundle 'autodate.vim'
NeoBundle 'surround.vim'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'L9'
NeoBundle 'kana/vim-altr'
NeoBundle 'thinca/vim-ref'
NeoBundle 'anekos/char-counter-vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'thinca/vim-tabrecent'

NeoBundleLazy 'sjl/gundo.vim', {'commands': ['GundoShow', 'GundoHide', 'GundoToggle', 'GundoRenderGraph']}
NeoBundleLazy 'yuratomo/w3m.vim', {'commands': ['W3m', 'W3mTab', 'W3mSplit', 'W3mLocal', 'W3mHistory', 'W3mHistoryClear']}

" color
NeoBundle 'w0ng/vim-hybrid'

" status line
NeoBundle 'itchyny/lightline.vim'

" operator
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'emonkak/vim-operator-comment'

" textobj
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'tokorom/vim-textobj-objc'

" ag
NeoBundleLazy 'rking/ag.vim', {'commands': ['Ag']}

" unite
NeoBundleLazy 'Shougo/unite.vim', {
  \   'commands': [
  \     {'name': 'Unite', 'complete': 'customlist,unite#complete_source'},
  \     'UniteWithCursorWord',
  \     'UniteWithInput'
  \   ]
  \ }
NeoBundleLazy 'Shougo/neomru.vim', {'depends': 'Shougo/unite.vim', 'on_source': 'unite.vim'}
" NeoBundleLazy 'h1mesuke/unite-outline', {'depends': 'Shougo/unite.vim', 'on_source': 'unite.vim'}
NeoBundleLazy 'tokorom/unite-xcode_complete', {'depends': 'Shougo/unite.vim', 'on_source': 'unite.vim'}

" neocomplete
NeoBundleLazy 'Shougo/neocomplete.vim',  {'function_prefix': 'neocomplete'}
NeoBundleLazy 'tokorom/neocomplete-ios-dictionary', {'depends' : 'Shougo/neocomplete.vim', 'on_source': 'neocomplete.vim'}

NeoBundle 'tokorom/swift-dict.vim'

" neosnippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets', {'depends': 'Shougo/neosnippet'}

" Codic
NeoBundleLazy 'koron/codic-vim', {
\  'commands': ['Codic'],
\  'function_prefix': 'codic',
\}
NeoBundleLazy 'rhysd/unite-codic.vim', {'depends': 'Shougo/unite.vim', 'on_source': 'unite.vim'}

" clang
NeoBundleLazy 'https://github.com/rhysd/vim-clang-format.git', {'filetypes': ['c', 'cpp', 'objc']}

" syntax check
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'tokorom/syntastic-swiftlint.vim', {'filetypes': ['swift'], 'depends': 'scrooloose/syntastic', 'on_source': 'syntastic'}

" git
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'airblade/vim-gitgutter'
NeoBundleLazy 'git://github.com/gregsexton/gitv.git', {'commands': ['GitV']}

" ruby
NeoBundleLazy 'git://github.com/tpope/vim-rails.git', {'filetypes': ['ruby']}

" markdown
NeoBundleLazy 'git://github.com/chrismetcalf/vim-markdown.git', {'filetypes': ['markdown']}

" objc
NeoBundleLazy 'git://github.com/tokorom/cocoa.vim.git', 'syntax-only', {'filetypes': ['objc']}
" NeoBundleLazy 'ryotakato/unite-outline-objc', {
"   \ 'depends' : 'h1mesuke/unite-outline',
"   \ 'filetypes' : ['objc']
"   \ }

" swift
" NeoBundle 'Keithbsmiley/swift.vim'
" ~/vimfiles_local/swift
NeoBundle 'tokorom/swift_gyb.vim'

" coffee
NeoBundleLazy 'git://github.com/kchmck/vim-coffee-script.git', {'filetypes': ['coffee']}

" json
NeoBundleLazy 'https://github.com/elzr/vim-json.git', {'filetypes': ['json']}

" uml
NeoBundle 'https://github.com/aklt/plantuml-syntax.git'

" html
NeoBundle 'slim-template/vim-slim'

" quickrun
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/osyo-manga/shabadou.vim.git'
NeoBundleLazy 'https://github.com/osyo-manga/vim-watchdogs.git', {'filetypes': ['objc']}
NeoBundleLazy 'https://github.com/jceb/vim-hier.git', {'filetypes': ['objc']}
NeoBundleLazy 'git://github.com/tokorom/vim-quickrun-xctool.git', {'filetypes': ['objc']}

" Qiita
NeoBundle 'mattn/qiita-vim'
NeoBundle 'mattn/webapi-vim'

" local
NeoBundleLocal ~/vimfiles_local/

" ファイルタイプ別セッティングON
filetype plugin indent on 

NeoBundleCheck

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
" ステータスラインを常に表示
"set laststatus=2
" ステータスライン表示設定
"set statusline=%<%f\ %m%r%h%w%y%{'\ \ \/'.(&fenc!=''?&fenc:&enc).'\/'.&ff.'\/'}%=%l,%c%V,%{b:charCounterCount}%8P
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

" 115文字以降をハイライト
" highlight ColorColumn ctermbg=black guibg=black
" execute "set colorcolumn=" . join(range(115, 300), ',')

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
cnoremap <S-Tab>  <C-d>

" 名前付きレジスタにヤンク
nnoremap [MyPrefix]y "yy
" 名前付きレジスタにヤンクして削除
nnoremap [MyPrefix]d "yd
" 名前付きレジスタからペースト
nnoremap [MyPrefix]p "yp
nnoremap [MyPrefix]P "yP
" クリップボードの内容を名前付きレジスタに逃がす
nnoremap [MyPrefix]" :<C-u>let @y=@*<CR>:echo @y<CR>
" 単語の置き換え(クリップボードの内容を保つ)
" nnoremap [MyPrefix]r "rciw<C-r>*<Esc>

" -- exchange source <--> header --

nmap [MyPrefix]a             <Plug>(altr-forward)
nmap [MyPrefix]A             <Plug>(altr-back)

" ---------- quick-fix ----------

nnoremap [MyPrefix]cm            :<C-u>w<CR>:<C-u>make<CR>
nnoremap [MyPrefix]cl            :<C-u>clist<CR>
nnoremap [MyPrefix]cc            :<C-u>cc<CR>
nnoremap [MyPrefix]cn            :<C-u>cn<CR>
nnoremap [MyPrefix]cp            :<C-u>cp<CR>

" ---------- original ----------

nnoremap [MyPrefix].  <Nop>
nnoremap [MyPrefix].. :<C-u>edit %:h<CR>
nnoremap [MyPrefix].v :<C-u>edit $MYVIMRC<CR>
nnoremap [MyPrefix].p :<C-u>edit $HOME/vimfiles/snippets/<CR>

" ---------- file ----------

nnoremap [MyPrefix]w             :<C-u>w<CR>
nnoremap [MyPrefix].e            :<C-u>e .<CR>
nnoremap <silent> <C-w><C-e>     :<C-u>vs<CR>:<C-u>e .<CR>

nnoremap [MyPrefix]t             :<C-u>tabnew 

" ---------- tab ----------

nnoremap <C-n>                   :<C-u>tabn<CR>
nnoremap <C-p>                   :<C-u>tabp<CR>

" ---------- unite ----------

nnoremap [MyPrefix].f :<C-u>Unite -start-insert buffer file_rec file/new<CR>
nnoremap [MyPrefix].b :<C-u>Unite -start-insert buffer<CR>
nnoremap [MyPrefix].r :<C-u>Unite -start-insert file_mru<CR>
nnoremap [MyPrefix].c :<C-u>Unite -start-insert codic<CR>
" nnoremap [MyPrefix].o :<C-u>Unite -start-insert outline<CR>

nnoremap [MyPrefix]g :<C-u>Unite grep:.<CR>
nnoremap <expr> [MyPrefix].g ':Unite grep:. -input=' . expand('<cword>')

" ---------- substitute ----------

" nnoremap <expr> [MyPrefix].s      ':%substitute/\<' . expand('<cword>') . '\>//gc<Left><Left><Left>'

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

omap ib <Plug>(textobj-multiblock-i)
omap ab <Plug>(textobj-multiblock-a)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

omap i<Space> <Plug>(textobj-between-i)
omap a<Space> <Plug>(textobj-between-a)
vmap i<Space> <Plug>(textobj-between-i)
vmap a<Space> <Plug>(textobj-between-a)

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

" source % の実行
command! SU :source %

" カレントファイルのディレクトリに移動 
command! -nargs=0 CdCurrent cd %:p:h

" 開発中pluginの再読込
"command! ReloadThisPlugin execute("unlet g:loaded_".expand("%:t:r")) | execute("source ".expand("%"))
"command! RT ReloadThisPlugin

" カレントバッファのファイル名を変更 by vim-users.jp
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" XMLの整形
command! XmlLint :exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Xcodeに現在のファイルを追加 : デバッグ中
command! -nargs=0 XcodeAddFile echo system('xcode_add_file ' . expand('%'))

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
  " mayu
  autocmd BufWinEnter,BufNewFile *.mayu,*.nodoka setfiletype mayu
  " rspec
  autocmd BufWinEnter,BufNewFile *_spec.rb setfiletype ruby.rspec
  " puthon.test
  autocmd BufWinEnter,BufNewFile test*.py setfiletype python.test
  " objc.test
  autocmd BufWinEnter,BufNewFile *Test.m setfiletype objc.test
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
if neobundle#tap('vim-smartinput') " {{{3
function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

call smartinput#clear_rules()
call smartinput#define_rule({
  \ 'at': '{\%#',
  \ 'char': '<Enter>',
  \ 'input': '<Enter>}<Esc>O',
  \ 'filetype': ['c', 'cpp', 'objc', 'swift'],
  \ })

"-----------------------------------------------------------------------------
endfunction " {{{3
call neobundle#untap()
endif " }}}3
" }}}2

" unite.vim {{{2
if neobundle#tap('unite.vim') " {{{3
function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

let g:unite_update_time = 50

call unite#custom#default_action('jump_list,file,buffer,openable', 'tabselect')
call unite#custom#default_action('source/outline/*', 'choose')

call unite#custom_source('file_rec', 'ignore_pattern', '\%(^\|/\)\%(build\|te?mp\)/\|\.\%(git\|o\|exe\|dll\|bak\|sw[po]\|class\|d\|dia\|gcda\|gcno\|png\|gif\|jpe?g\)$')

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

"-----------------------------------------------------------------------------
endfunction " {{{3
call neobundle#untap()
endif " }}}3
" }}}2

" unite-xcode_complete {{{2
if neobundle#tap('unite-xcode_complete') " {{{3
function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

autocmd FileType objc inoremap <silent><expr> <C-x><C-o>
  \ unite#start_complete(
  \   ['xcode_complete'],
  \   {
  \     'start_insert' : 1,
  \     'input' : unite#sources#xcode_complete#get_cur_text(),
  \   }
  \ )

"-----------------------------------------------------------------------------
endfunction " {{{3
call neobundle#untap()
endif " }}}3
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

if neobundle#tap('neocomplete.vim') " {{{3
function! neobundle#tapped.hooks.on_source(bundle) " }}}3
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
endfunction " {{{3
call neobundle#untap()
endif " }}}3
" }}}2

" neocomplete-ios-dictionary {{{2
"-----------------------------------------------------------------------------

call neocomplete_ios_dictionary#configure_ios_dict()

"-----------------------------------------------------------------------------
" }}}2

" vim-clang-format {{{2
if neobundle#tap('vim-clang-format') " {{{3
function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

autocmd FileType objc call s:clang_format_settings()
function! s:clang_format_settings()
  " key mapping
  map = <Plug>(operator-clang-format)
  nnoremap [MyPrefix].w :call SaveWithFormat()<CR>
endfunction

function! SaveWithFormat()
  if filereadable(expand('.clang-format'))
    augroup SaveWithFormat
      autocmd!
      autocmd BufWritePre * if &ft ==# 'objc' | call clang_format#replace(1, line('$')) | endif
    augroup END
  endif

  execute ':w'

  augroup SaveWithFormat
    autocmd!
  augroup END
endfunction

"-----------------------------------------------------------------------------
endfunction " {{{3
call neobundle#untap()
endif " }}}3
" }}}2

" neosnippet {{{2
if neobundle#tap('neosnippet') " {{{3
function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

let g:neosnippet#snippets_directory = "$HOME/vimfiles/snippets"
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
endfunction " {{{3
call neobundle#untap()
endif " }}}3
" }}}2

" vim-quickrun {{{2
if neobundle#tap('vim-quickrun') " {{{3
function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

" initialize

let g:quickrun_config = {}

" config

let g:quickrun_config['*'] = {'split': 'below'}
let g:quickrun_config['python.test'] = {'command': 'nosetests', 'exec': ['%c -v %s'], 'filetype': 'nosetests-result'}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '--format progress -I .', 'exec': ['source .rvmrc \&\& %c %o %s %a'], 'filetype': 'rspec-result'}
let g:quickrun_config['objc'] = {'command': 'objc-run', 'cmdopt': '-fblocks -fobjc-arc', 'exec': ['%c %s %o %a']}
let g:quickrun_config['objc.test'] = {'command': 'xctool', 'cmdopt': 'test', 'outputter': 'xctool', 'exec': ['%c %o %a']}
let g:quickrun_config['swift'] = {'command': 'xcrun swift', 'cmdopt': '', 'exec': ['%c %s %o %a']}

let g:quickrun_config['markdown'] = {
  \ 'outputter' : 'null',
  \ 'command' : 'open',
  \ 'cmdopt' : '-a',
  \ 'args' : 'Marked\ 2',
  \ 'exec' : '%c %o %a %s',
  \ }

" watchdogs

let g:quickrun_config['watchdogs_checker/xcodebuild'] = {
  \ 'command'  : 'xcodebuild',
  \ 'exec'     : '%c %o',
  \ 'quickfix/errorformat' : "%f:%l:%c:{%*[^}]}: error: %m,%f:%l:%c:{%*[^}]}: fatal error: %m,%f:%l:%c:{%*[^}]}: warning: %m,%f:%l:%c: error: %m,%f:%l:%c: fatal error: %m,%f:%l:%c: warning: %m,%f:%l: Error: %m,%f:%l: error: %m,%f:%l: fatal error: %m,%f:%l: warning: %m",
  \ }

let g:quickrun_config['objc/watchdogs_checker'] = {
  \ 'type' : 'watchdogs_checker/xcodebuild',
  \ 'outputter/quickfix/open_cmd' : '',
  \ }

call watchdogs#setup(g:quickrun_config)

" keymap

map [MyPrefix]q <Nop>
map [MyPrefix]q <Plug>(quickrun)

"-----------------------------------------------------------------------------
endfunction " {{{3
call neobundle#untap()
endif " }}}3
" }}}2

" vim-watchdogs {{{2
if neobundle#tap('vim-watchdogs') " {{{3
function! neobundle#tapped.hooks.on_source(bundle) " }}}3
"-----------------------------------------------------------------------------

" バッファ書き込み後にWatchdogsRunSilent
let g:watchdogs_check_BufWritePost_enable = 1
" 一定時間キー入力がなかった場合にWatchdogsRunSilent
let g:watchdogs_check_CursorHold_enable = 1

"-----------------------------------------------------------------------------
endfunction " {{{3
call neobundle#untap()
endif " }}}3
" }}}2

" syntastic {{{2
if neobundle#tap('syntastic') " {{{3
function! neobundle#tapped.hooks.on_source(bundle) " }}}3
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

"-----------------------------------------------------------------------------
endfunction " {{{3
call neobundle#untap()
endif " }}}3
" }}}2

" }}}1
