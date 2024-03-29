scriptencoding utf-8

" ########## vimrc ##########

autocmd!
if &compatible
 set nocompatible
endif

"=============================================================================
" set environments {{{1

let $VIMHOME = $HOME.'/.vim'
let $MYVIMRC = $HOME.'/.vimrc'

" 1}}}

"=============================================================================
" plugins {{{1

" Use thinpl
" https://github.com/tokorom/thinpl

" 1}}}

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
set completeopt=menuone,noinsert,noselect,preview

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
set switchbuf+=useopen,split

" netrwのbufferをbdで削除できるように
autocmd FileType netrw setlocal bufhidden=wipe

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
nnoremap [MyPrefix].. :<C-u>tabnew %:h<CR>
nnoremap [MyPrefix]s  :<C-u>source %<CR>
nnoremap [MyPrefix].v :<C-u>tabnew $MYVIMRC<CR>
nnoremap [MyPrefix].s :<C-u>tabnew $VIMHOME/snippets/<CR>
nnoremap [MyPrefix].p :<C-u>tabnew $VIMHOME/plugins.vim<CR>

" ---------- file ----------

nnoremap [MyPrefix]w             :<C-u>w<CR>

" ---------- buffer ----------

nnoremap [MyPrefix]t             :<C-u>tabnew<Space>
nnoremap [MyPrefix]e             :<C-u>e<Space>
nnoremap <C-n>                   :<C-u>tabnext<CR>
nnoremap <C-p>                   :<C-u>tabprevious<CR>

" ---------- window ----------
nnoremap <C-w>g                  :<C-u>:terminal ++shell ++close tigs<CR>

" ---------- dictionary ----------

" nnoremap <expr> [MyPrefix]d ':!open dict://' . expand('<cword>')
nnoremap <expr> [MyPrefix]d ':!open dash://' . expand('<cword>')

" ---------- commands ----------

nnoremap [MyPrefix]ze             <S-v>!deepl-cui-swift -s JA -w<CR>
vnoremap ze                       !deepl-cui-swift -s JA -w<CR>

" }}}1

"=============================================================================
" my commands {{{1

" refresh syntax highlight
command! SyntaxRefresh :syn off | syn on

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
augroup END

" }}}1
