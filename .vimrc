" ########## vimrc ##########

" initializing

autocmd!

" Vimballのインストール先設定
let g:vimball_home=$HOME."/vimfiles"

"ファイルタイプ別セッティングON
filetype plugin indent on 

"日本語入力設定
set imsearch=0
set iminsert=0
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-2,latin1
set fileformats=unix,dos,mac

"挿入モードでのバックスペースの挙動設定
set backspace=indent,eol,start

" ========== 表示設定 ==========

"カラースキーマを設定
colorscheme neon
"hilight
syntax on
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"ステータスラインを常に表示
set laststatus=2
"ステータスライン表示設定
set statusline=%<%f\ %m%r%h%w%y%{'\ \ \/'.(&fenc!=''?&fenc:&enc).'\/'.&ff.'\/'}%=%l,%c%V%8P
" 不可視文字を表示
set list
set lcs=tab:>\ 

" ========== インデント設定 ==========

"新しい行のインデントを現在行と同じにする
set autoindent
"タブの代わりに空白文字を挿入する
set expandtab
"シフト移動幅
set shiftwidth=2
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"新しい行を作ったときに高度な自動インデントを行う
set smartindent

" ========== ファイル保存設定 ==========

"スワップファイル＆バックアップファイルを作るディレクトリ
set backupdir=$HOME/backup
set directory=$HOME/backup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

" ========== yank設定 ==========

"クリップボードをOSと連携
set clipboard=unnamed

" ========== search設定 ==========

"インクリメンタルサーチを行う
set incsearch
"マッチした文字列をハイライト
set hlsearch
"検索時に大文字を含んでいたら大/小を区別
set ignorecase smartcase

" ========== grep設定 ==========

" vimgrep時に自動でQuickFixを開く設定
autocmd QuickfixCmdPost vimgrep cw

" ========== move設定 ==========

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" ========== Align設定 ==========

" Alignを日本語環境で使用するための設定
let g:Align_xstrlen = 3

" ========== その他設定 ==========

" for FuzzyFinder

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

" for ref.vim

let g:ref_use_vimproc = 0
let g:ref_open = "vsplit"

" ========== マルチバイトを使ううえで ==========

" 記号文字の表示がおかしくならないように
set ambiwidth=double

" ========== 補完の設定 ==========

set completeopt=menu,preview,longest

" ========== include ==========

source $HOME/vimfiles/keybinding.vim
source $HOME/vimfiles/functions.vim
source $HOME/vimfiles/addft.vim

" ========== autodate設定 ==========

let autodate_format="%Y-%m-%d"

" ========== QuickRun ==========

let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': "async:remote:vimproc", 'split': 'below'}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'exec': ['%c -I . %s']}
let g:quickrun_config['python.unit'] = {'command': 'nosetests', 'exec': ['%c -v %s']}

let g:quickrun_switcher_config = {}
let g:quickrun_switcher_config['python.unit'] = {}
let g:quickrun_switcher_config['python.unit']['all'] = {'command': 'nosetests', 'exec': ['%c -v %s']}
let g:quickrun_switcher_config['python.unit']['one'] = {'command': 'nosetests', 'exec': ['%c -v %s:{QuickNoseGetCurrentTestCase()}']}

" ========== onCreate ==========

cd ~/
