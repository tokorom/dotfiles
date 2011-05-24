" ########## vimrc ##########

autocmd!

"=============================================================================
" Bundle (Vundle) {{{1

set nocompatible
filetype off
set rtp+=$HOME/vimfiles/vundle.git/
call vundle#rc()

" original repos on github
" Bundle 'tpope/vim-fugitive'
" vim-scripts repos
" Bundle 'rails.vim'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

" }}}1
"=============================================================================
" 基本設定 {{{1

" ファイルタイプ別セッティングON
filetype plugin indent on 

" 日本語入力設定
set imsearch=0
set iminsert=0
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-2,latin1
set fileformats=unix,dos,mac

" 挿入モードでのバックスペースの挙動設定
set backspace=indent,eol,start

" カラースキーマを設定
colorscheme neon
" hilight
syntax on
" 行番号を表示する
set number
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" ステータスラインを常に表示
set laststatus=2
" ステータスライン表示設定
set statusline=%<%f\ %m%r%h%w%y%{'\ \ \/'.(&fenc!=''?&fenc:&enc).'\/'.&ff.'\/'}%=%l,%c%V%8P
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

" スワップファイル＆バックアップファイルを作るディレクトリ
set backupdir=$HOME/backup
set directory=$HOME/backup
" ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden

" クリップボードをOSと連携
set clipboard=unnamed

"インクリメンタルサーチを行う
set incsearch
"マッチした文字列をハイライト
set hlsearch
"検索時に大文字を含んでいたら大/小を区別
set ignorecase smartcase

" vimgrep時に自動でQuickFixを開く設定
autocmd QuickfixCmdPost vimgrep cw

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 記号文字の表示がおかしくならないように
set ambiwidth=double

" 補完の設定
set completeopt=menu,preview,longest

" 日付の自動入力のフォーマット
let autodate_format="%Y-%m-%d"

" }}}1
"=============================================================================
" plugin settings {{{1

" FuzzyFinder

let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_maxItem = 1000
let g:fuf_enumeratingLimit = 50
let g:fuf_file_recursiveLimit = 2000
let g:fuf_dataDir = $HOME.'/vim_fuf_data'
let g:MRU_File = $HOME.'/vim_fuf_data/_mru_file'

let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.svn$'
let g:fuf_mrufile_exclude = g:fuf_file_exclude

let g:fuf_keyOpen = '<Tab>'
let g:fuf_keyOpenTabpage = '<CR>'

" ref.vim

let g:ref_use_vimproc = 0
let g:ref_open = "vsplit"


" quickrun.vim

let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': "async:remote:vimproc", 'split': 'below'}
let g:quickrun_config['python.test'] = {'command': 'nosetests', 'exec': ['%c -v %s']}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'exec': ['%c -I . %s']}

let g:quickrun_switcher_config = {}
let g:quickrun_switcher_config['python.test'] = {}
let g:quickrun_switcher_config['python.test']['all'] = {'command': 'nosetests', 'exec': ['%c -v %s']}
let g:quickrun_switcher_config['python.test']['one'] = {'command': 'nosetests', 'exec': ['%c -v %s:{QuickNoseGetCurrentTestCase()}']}
let g:quickrun_switcher_config['ruby.rspec'] = {}
let g:quickrun_switcher_config['ruby.rspec']['all'] = {'command': 'rspec', 'exec': ['%c -I . %s']}
let g:quickrun_switcher_config['ruby.rspec']['one'] = {'command': 'rspec', 'exec': ['%c -I . %s -l {line(".")}']}

" }}}1
"=============================================================================
" includes {{{1

source $HOME/vimfiles/keybinding.vim
source $HOME/vimfiles/functions.vim
source $HOME/vimfiles/addft.vim

" }}}1

cd ~/
