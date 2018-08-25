" ########## vimrc ##########

autocmd!
if &compatible
 set nocompatible
endif

"=============================================================================
" set environments {{{1

let $VIMHOME = $HOME.'/.vim'
let $VIMLOCAL = $VIMHOME.'/.localplugins'

" 1}}}

"=============================================================================
" plugins (dein) {{{1

let $PLUGINS = expand($VIMHOME.'/dein.toml')
let $PLUGINSDIR = expand($VIMHOME.'/.plugins')

" dein header {{{2
" Clone dein if needed {{{3
let dein_repo = 'Shougo/dein.vim'
if &runtimepath !~# dein_repo
  let dein_repo_dir = $PLUGINSDIR.'/repos/github.com/'.dein_repo
  if !isdirectory(dein_repo_dir)
    execute '!git clone https://github.com/'.dein_repo dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(dein_repo_dir, ':p')
endif
" 3}}}

" {{{3
if dein#load_state($PLUGINSDIR)
call dein#begin($PLUGINSDIR)
call dein#add($PLUGINSDIR)
" 3}}}
" 2}}}

call dein#load_toml($PLUGINS)

" dein footer {{{2
call dein#end()
call dein#save_state()
endif
" 2}}}

" dein commands {{{2
command! DeinCheck :call dein#check_install()
command! DeinInstall :call dein#install()
" 2}}}

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

" tab
set switchbuf+=usetab,newtab

" }}}1

"=============================================================================
" keymapping {{{1

" ---------- general ----------

noremap [MyPrefix] <Nop>
map <Space> [MyPrefix]
noremap [DoublePrefix] <Nop>
map <Space><Space> [DoublePrefix]

set winaltkeys=no
inoremap  <C-l>   <Esc>

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

" ---------- location list ----------

nnoremap [MyPrefix]ll            :<C-u>ll<CR>
nnoremap [MyPrefix]ln            :<C-u>lnext<CR>
nnoremap [MyPrefix]lp            :<C-u>lprevious<CR>

" ---------- original ----------

nnoremap [MyPrefix].  <Nop>
nnoremap [MyPrefix].. :<C-u>edit %:h<CR>
nnoremap [MyPrefix].v :<C-u>edit $MYVIMRC<CR>
nnoremap [MyPrefix].p :<C-u>edit $PLUGINS<CR>
nnoremap [MyPrefix].s :<C-u>edit $VIMHOME/snippets/<CR>

" ---------- file ----------

nnoremap [MyPrefix]w             :<C-u>w<CR>
nnoremap [MyPrefix].e            :<C-u>e .<CR>

" ---------- tab ----------

nnoremap [MyPrefix]t             :<C-u>tabnew 
nnoremap <C-n>                   :<C-u>tabn<CR>
nnoremap <C-p>                   :<C-u>tabp<CR>

" ---------- buffer ----------

nnoremap [MyPrefix]j       :<C-u>bn<CR>
nnoremap [MyPrefix]k       :<C-u>bp<CR>

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
" add filetypes autocmd BufNewFile,BufRead *.re setf review{{{1

augroup AddFileType
  autocmd!
  " iOS
  autocmd BufNewFile,BufRead Podfile,*.podspec,Fastfile setfiletype ruby
  autocmd BufNewFile,BufRead apple-app-site-association setfiletype json
  autocmd BufNewFile,BufRead *.swift setfiletype swift
augroup END

" }}}1
