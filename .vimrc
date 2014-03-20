" ########## vimrc ##########

autocmd!

set nocompatible
filetype off

"=============================================================================
" Bundle (NeoBundle) {{{1

if has('vim_starting')
  set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim/
endif
call neobundle#rc(expand('$HOME/vimfiles/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

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
NeoBundle 'git://github.com/kana/vim-fakeclip.git'
NeoBundle 'L9'
NeoBundle 'git://github.com/kana/vim-altr.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'anekos/char-counter-vim'

NeoBundleLazy 'git://github.com/sjl/gundo.vim.git', {'autoload': {'commands': ['GundoShow', 'GundoHide', 'GundoToggle', 'GundoRenderGraph']}}
NeoBundleLazy 'git://github.com/yuratomo/w3m.vim.git', {'autoload': {'commands': ['W3m', 'W3mTab', 'W3mSplit', 'W3mLocal', 'W3mHistory', 'W3mHistoryClear']}}

" color
NeoBundle 'git://github.com/w0ng/vim-hybrid.git'

" status line
NeoBundle 'https://github.com/itchyny/lightline.vim.git'

" operator
NeoBundle 'https://github.com/kana/vim-operator-user.git'
NeoBundle 'https://github.com/kana/vim-operator-replace.git'
NeoBundle 'https://github.com/emonkak/vim-operator-comment.git'

" textobj
NeoBundle 'https://github.com/kana/vim-textobj-user.git'
NeoBundle 'https://github.com/kana/vim-textobj-line.git'
NeoBundle 'https://github.com/kana/vim-textobj-entire.git'
NeoBundle 'https://github.com/kana/vim-textobj-indent.git'
NeoBundle 'https://github.com/kana/vim-textobj-function.git'
NeoBundle 'https://github.com/osyo-manga/vim-textobj-multiblock.git'
NeoBundle 'https://github.com/thinca/vim-textobj-between.git'

" ag
NeoBundleLazy 'rking/ag.vim', {'autoload': {'commands': ['Ag']}}

" unite
NeoBundleLazy 'Shougo/unite.vim', {
      \ 'commands' : [{ 'name' : 'Unite',
      \ 'complete' : 'customlist,unite#complete_source'},
      \ 'UniteWithCursorWord', 'UniteWithInput']
      \ }
NeoBundle 'Shougo/neomru.vim'

" neocomplcache
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neosnippet.git'

" clang
" NeoBundleLazy 'git://github.com/tokorom/clang_complete.git', {'autoload': {'filetypes': ['c', 'cpp', 'objc']}}
NeoBundleLazy 'https://github.com/rhysd/vim-clang-format.git', {'autoload': {'filetypes': ['c', 'cpp', 'objc']}}

" syntax check
NeoBundleLazy 'git://github.com/scrooloose/syntastic.git', {'autoload': {'filetypes': ['xml', 'html', 'sass', 'css', 'js', 'yaml', 'json', 'xslt', 'python', 'perl', 'c']}}

" git
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundleLazy 'git://github.com/gregsexton/gitv.git', {'autoload': {'commands': ['GitV']}}

" html
NeoBundleLazy 'ZenCoding.vim', {'autoload': {'filetypes': ['html']}}

" ruby
NeoBundleLazy 'git://github.com/tpope/vim-rails.git', {'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'git://github.com/tobiassvn/vim-gemfile.git', {'autoload': {'filetypes': ['ruby']}}

" markdown
NeoBundleLazy 'git://github.com/chrismetcalf/vim-markdown.git', {'autoload': {'filetypes': ['markdown']}}

" objc
NeoBundleLazy 'git://github.com/tokorom/cocoa.vim.git', 'syntax-only', {'autoload': {'filetypes': ['objc']}}
" NeoBundleLazy 'git@github.com:tokorom/clang_complete-getopts-ios.git', {'autoload': {'filetypes': ['objc']}}

" coffee
NeoBundleLazy 'git://github.com/kchmck/vim-coffee-script.git', {'autoload': {'filetypes': ['coffee']}}

" json
NeoBundleLazy 'https://github.com/elzr/vim-json.git', {'autoload': {'filetypes': ['json']}}

" uml
NeoBundle 'https://github.com/aklt/plantuml-syntax.git'

" quickrun
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/osyo-manga/shabadou.vim.git'
NeoBundleLazy 'https://github.com/osyo-manga/vim-watchdogs.git', {'autoload': {'filetypes': ['objc']}}
NeoBundleLazy 'https://github.com/jceb/vim-hier.git', {'autoload': {'filetypes': ['objc']}}
NeoBundleLazy 'git://github.com/tokorom/vim-quickrun-xctool.git', {'autoload': {'filetypes': ['objc']}}

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
set completeopt=menu,preview,longest

" 日付の自動入力のフォーマット
let autodate_format="%Y-%m-%d"

" 折り畳み設定
set foldmethod=marker

" クリップボードを自動で利用 
set clipboard=unnamed

" cursorline
set cursorline
highlight clear CursorLine
highlight CursorLine ctermbg=black guibg=black

" 115文字以降をハイライト
highlight ColorColumn ctermbg=black guibg=black
execute "set colorcolumn=" . join(range(115, 300), ',')

" }}}1
"=============================================================================
" keybindings {{{1

" ---------- general ----------

noremap [MyPrefix] <Nop>
map <Space> [MyPrefix]
noremap [MyDoublePrefix] <Nop>
map <Space><Space> [MyDoublePrefix]

set winaltkeys=no
inoremap  <C-l>   <Esc>:<C-u>w<CR>

" ---------- for MacVim ----------

nnoremap <S-C>   c$

" ---------- move ----------

noremap  <silent> <C-a>    <Esc>:<C-u>MoveToZero<CR>
noremap  <silent> <C-e>    $
noremap j gj
noremap k gk
noremap gj j
noremap gk k
vnoremap L l/)<CR>h
vnoremap H h?(<CR>l
nnoremap L l/)<CR>:noh<CR>h
nnoremap H h?(<CR>:noh<CR>l

" ---------- insert mode ----------

inoremap <C-d>     <Delete>

" ---------- visual mode ----------

nnoremap gc   '[v']
vnoremap gc   :<C-u>normal gc<Enter>
onoremap gc   :<C-u>normal gc<Enter>

" ---------- command mode ----------

cnoremap <C-f>    <Right>
cnoremap <C-b>    <Left>
cnoremap <C-a>    <Home>
cnoremap <C-e>    <End>
cnoremap <C-d>    <Del>
cnoremap <C-h>    <BackSpace>
cnoremap <S-Tab>  <C-d>

nnoremap [MyPrefix]o             A;<Esc>o

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
nmap [MyDoublePrefix]a       :<C-u>vs<CR><C-w><C-w><Plug>(altr-forward)
nmap [MyDoublePrefix]A       :<C-u>vs<CR><C-w><C-w><Plug>(altr-back)

" ---------- quick-fix ----------

nnoremap [MyPrefix]cm            :<C-u>w<CR>:<C-u>make<CR>
nnoremap [MyPrefix]cl            :<C-u>clist<CR>
nnoremap [MyDoublePrefix]cl      :<C-u>clist!<CR>
nnoremap [MyPrefix]cc            :<C-u>cc<CR>
nnoremap [MyPrefix]cn            :<C-u>cn<CR>
nnoremap [MyPrefix]cp            :<C-u>cp<CR>

" ---------- original ----------

nnoremap [MyPrefix].  <Nop>
nnoremap [MyPrefix].. :<C-u>edit %:h<CR>
nnoremap [MyPrefix].v :<C-u>edit $MYVIMRC<Enter>
nnoremap [MyDoublePrefix].v :<C-u>source $MYVIMRC<Enter>:echo "source .vimrc"<Enter>
nnoremap [MyPrefix].p :<C-u>edit $HOME/vimfiles/snippets/<Enter>

" ---------- file ----------

nnoremap [MyPrefix]w             :<C-u>w<CR>
nnoremap [MyPrefix].e            :<C-u>e .<CR>
nnoremap <silent> <C-w><C-e>     :<C-u>vs<CR>:<C-u>e .<CR>

nnoremap [MyPrefix]t             :<C-u>tabnew 

" ---------- tab ----------

nnoremap <C-n>                   :<C-u>tabn<CR>
nnoremap <C-p>                   :<C-u>tabp<CR>

" ---------- unite ----------

nnoremap [MyPrefix].f :<C-u>Unite -start-insert -default-action=tabopen buffer file_rec<CR>
nnoremap [MyPrefix].b :<C-u>Unite -default-action=tabopen buffer<CR>
nnoremap [MyPrefix].r :<C-u>Unite -default-action=tabopen file_mru<CR>

nnoremap [MyPrefix]g :<C-u>Unite grep:. -default-action=tabopen<CR>
nnoremap <expr> [MyPrefix].g ':Unite grep:. -default-action=tabopen -input=' . expand('<cword>')

let g:ios_framework_dir = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS7.1.sdk/System/Library/Frameworks"
nnoremap <expr> [MyPrefix].i ':Unite grep:"' . g:ios_framework_dir . '" -default-action=tabopen -input=' . expand('<cword>')

" ---------- substitute ----------

nnoremap <expr> [MyPrefix].s      ':%substitute/\<' . expand('<cword>') . '\>//gc<Left><Left><Left>'
nnoremap [MyDoublePrefix].s       :<C-u>%substitute///gc<Left><Left><Left><Left>

" ---------- buffer ----------

nnoremap [MyPrefix]j       :<C-u>bn<CR>
nnoremap [MyPrefix]k       :<C-u>bp<CR>

" ---------- operator ----------

nmap <Space>r <Plug>(operator-replace)
vmap <Space>r <Plug>(operator-replace)
nmap <Space>rr <Plug>(operator-replace)iw

nmap <Space>x <Plug>(operator-comment)
nmap <Space>z <Plug>(operator-uncomment)
vmap <Space>x <Plug>(operator-comment)
vmap <Space>z <Plug>(operator-uncomment)
nmap <Space>xx <Plug>(operator-comment)l
nmap <Space>zz <Plug>(operator-uncomment)l

" ---------- textobj ----------

omap l <Plug>(textobj-line-a)
vmap l <Plug>(textobj-line-a)

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
augroup END

" }}}1
"=============================================================================
" plugin settings {{{1

" lightline {{{2
"let s:hooks = neobundle#get_hooks("lightline.vim")
"function! s:hooks.on_source(bundle)
"-----------------------------------------------------------------------------
"
let g:lightline = {'colorscheme': 'wombat'}

"-----------------------------------------------------------------------------
"endfunction
" }}}2

" unite {{{2
let s:hooks = neobundle#get_hooks("unite.vim")
function! s:hooks.on_source(bundle)
"-----------------------------------------------------------------------------

let g:unite_update_time = 50

call unite#custom_source('file_rec', 'ignore_pattern', 'build\|\.\%(git\|o\|exe\|dll\|bak\|sw[po]\|class\|d\|dia\|gcda\|gcno\|png\|gif\|jpe?g\)$')

" use `ag` for grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--smart-case --nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 0
endif

" close preview window
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nnoremap <silent><buffer><expr> c
        \ empty(filter(range(1, winnr('$')),
        \ 'getwinvar(v:val, "&previewwindow") != 0')) ?
        \ unite#do_action('preview') : ":\<C-u>pclose!\<CR>"
  nmap <silent><buffer> / i<Space>
endfunction

"-----------------------------------------------------------------------------
endfunction
" }}}2

" ctrlp {{{2
" let s:hooks = neobundle#get_hooks("ctrlp.vim")
" function! s:hooks.on_source(bundle)
" "-----------------------------------------------------------------------------
"
" let g:ctrlp_map = ''
" let g:ctrlp_by_filename = 0
" let g:ctrlp_switch_buffer = 'ET'
"
" let g:ctrlp_prompt_mappings = {
"   \ 'AcceptSelection("e")': ['<C-x>', '<2-LeftMouse>'],
"   \ 'AcceptSelection("t")': ['<CR>'],
"   \ 'AcceptSelection("h")': ['<c-cr>', '<c-s>'],
"   \ }
"
" let g:ctrlp_custom_ignore = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.svn$|\.d$|\.dia$|\.gcda$|\.gcno'
" let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*|/backup/*'
"
" let g:ctrlp_docset_docsetutil_command = '/Applications/Xcode.app/Contents/Developer/usr/bin/docsetutil'
" let g:ctrlp_docset_filepaths = {}
" let g:ctrlp_docset_filepaths['objc'] = '~/Library/Developer/Shared/Documentation/DocSets/com.apple.adc.documentation.AppleiOS6.1.iOSLibrary.docset'
" let g:ctrlp_docset_accept_command = ':W3mSplit local %s'
"
" " nnoremap [MyPrefix].f :<C-u>CtrlP .<CR>
" " nnoremap [MyPrefix].b :<C-u>CtrlPBuffer<CR>
" " nnoremap [MyPrefix].r :<C-u>CtrlPMRU<CR>
" nnoremap [MyPrefix].m :<C-u>CtrlPMark<CR>
" nnoremap [MyPrefix]." :<C-u>CtrlPRegister<CR>
" nnoremap [MyPrefix].d :<C-u>CtrlPDocset<CR>
" nnoremap [MyPrefix].l :<C-u>CtrlPFunky<CR>
"
" " CtrlPのCacheクリア
" command! CC :CtrlPClearAllCaches
"
" nnoremap <C-p>                   :<C-u>tabp<CR>
"
" "-----------------------------------------------------------------------------
" endfunction
" }}}2

" ZenCoding {{{2
let s:hooks = neobundle#get_hooks("ZenCoding.vim")
function! s:hooks.on_source(bundle)
"-----------------------------------------------------------------------------

let g:user_zen_settings = {
\  'indentation' : '  '
\}

"-----------------------------------------------------------------------------
endfunction
" }}}2

" neocomplcache {{{2
"let s:hooks = neobundle#get_hooks("neocomplcache")
"function! s:hooks.on_source(bundle)
"-----------------------------------------------------------------------------

let g:neocomplcache_enable_at_startup = 1 "自動起動
let g:neocomplcache_disable_auto_complete = 1 "自動補完はしない（手動補完のみとする)
let g:neocomplcache_enable_smart_case = 1 "大文字小文字無視
let g:neocomplcache_enable_underbar_completion = 1 " _区切り補完
let g:neocomplcache_lock_buffer_name_pattern = '\*fuf\*' "fufでは利用しない 
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
let g:neocomplcache_enable_auto_select = 1 "最初の候補を自動選択 
let g:neocomplcache_max_list = 10000

inoremap <expr><C-x><C-f neocomplcache#manual_filename_complete()
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : neocomplcache#start_manual_complete()
inoremap <expr><C-o> neocomplcache#start_manual_complete()
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"

let g:neocomplcache_source_rank = {
\ 'snippets_complete' : 500,
\ 'abbrev_complete' : 400,
\ }

"-----------------------------------------------------------------------------
"endfunction
" }}}2

" clang_complete {{{2
let s:hooks = neobundle#get_hooks("clang_complete")
function! s:hooks.on_source(bundle)
"-----------------------------------------------------------------------------

if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c =
\ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
\ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc =
\ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.objcpp =
\ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0

"-----------------------------------------------------------------------------
endfunction
" }}}2

" clang_complete {{{2
let s:hooks = neobundle#get_hooks("clang_complete-getopts-ios")
function! s:hooks.on_source(bundle)
"-----------------------------------------------------------------------------

let g:clang_auto_user_options = 'path, .clang_complete, ios'
let g:clang_complete_getopts_ios_sdk_directory = '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk'

"-----------------------------------------------------------------------------
endfunction
" }}}2

" neosnippet {{{2
let s:hooks = neobundle#get_hooks("neosnippet")
function! s:hooks.on_source(bundle)
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
endfunction
" }}}2

" w3m {{{2
let s:hooks = neobundle#get_hooks("w3m.vim")
function! s:hooks.on_source(bundle)
"-----------------------------------------------------------------------------

let g:w3m#disable_vimproc = 1

"-----------------------------------------------------------------------------
endfunction
" }}}2

" quickrun {{{2
let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
"-----------------------------------------------------------------------------

" initialize

let g:quickrun_config = {}

" config

let g:quickrun_config['*'] = {'split': 'below'}
let g:quickrun_config['python.test'] = {'command': 'nosetests', 'exec': ['%c -v %s'], 'filetype': 'nosetests-result'}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '--format progress -I .', 'exec': ['source .rvmrc \&\& %c %o %s %a'], 'filetype': 'rspec-result'}
let g:quickrun_config['objc'] = {'command': 'objc-run', 'exec': ['%c %s %a']}
let g:quickrun_config['objc.test'] = {'command': 'xctool', 'cmdopt': 'test', 'outputter': 'xctool', 'exec': ['%c %o %a']}

let g:quickrun_config['markdown'] = {
  \ 'outputter' : 'null',
  \ 'command' : 'open',
  \ 'cmdopt' : '-a',
  \ 'args' : 'Marked',
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
  \ }

call watchdogs#setup(g:quickrun_config)

" keymap

map [MyPrefix]q <Nop>
map [MyPrefix]q <Plug>(quickrun)

"-----------------------------------------------------------------------------
endfunction
" }}}2

" quickrun {{{2
let s:hooks = neobundle#get_hooks("vim-watchdogs")
function! s:hooks.on_source(bundle)
"-----------------------------------------------------------------------------

" バッファ書き込み後にWatchdogsRunSilent
let g:watchdogs_check_BufWritePost_enable = 1
" 一定時間キー入力がなかった場合にWatchdogsRunSilent
let g:watchdogs_check_CursorHold_enable = 1

"-----------------------------------------------------------------------------
endfunction
" }}}2

" }}}1
