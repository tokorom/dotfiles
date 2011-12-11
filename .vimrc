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

Bundle 'surround.vim'
Bundle 'autodate.vim'
Bundle 'git://github.com/kana/vim-fakeclip.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'The-NERD-Commenter'
Bundle 'git://github.com/tyru/open-browser.vim.git'
Bundle 'git://github.com/Shougo/vimproc.git'
Bundle 'ZenCoding.vim'
Bundle 'neocomplcache'
Bundle 'git://github.com/thinca/vim-quickrun.git'
Bundle 'git://github.com/kana/vim-altr.git'
Bundle 'git://github.com/thinca/vim-ref.git'
Bundle 'ack.vim'
Bundle 'git://github.com/tpope/vim-rails.git'
Bundle 'git://github.com/mattn/gist-vim.git'

Bundle 'unite.vim'
Bundle 'unite-font'
Bundle 'unite-colorscheme'

" my plugins
Bundle 'git://github.com/tokorom/brew.vim.git'
Bundle 'git://gist.github.com/997811.git'
Bundle 'git://github.com/tokorom/snipmate.vim.git'
Bundle 'git://github.com/tokorom/zoom.vim.git'

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

" 折り畳み設定
set foldmethod=marker

" クリップボードを自動で利用 
set clipboard=unnamed

" }}}1
"=============================================================================
" keybindings {{{1

" ---------- general ----------

noremap [MyPrefix] <Nop>
map <Space> [MyPrefix]
noremap [MyDoublePrefix] <Nop>
map <Space><Space> [MyDoublePrefix]

set winaltkeys=no
noremap  <C-l>   <Esc>
noremap! <C-l>   <Esc>

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
nnoremap [MyPrefix]r "rciw<C-r>*<Esc>

" 全選択
nnoremap [MyPrefix]<C-a> ggVG

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

" ---------- complete ----------

" complete
inoremap <expr> <Enter>    pumvisible()?"\<C-y>":"\<Enter>"

" omni complete
inoremap <expr> <C-j>      pumvisible()?"\<Down>":"\<C-x><C-o>"
inoremap <expr> <C-k>      pumvisible()?"\<Up>":"\<C-k>"

" ---------- original ----------

nnoremap [MyPrefix].  <Nop>
nnoremap [MyPrefix].. :<C-u>edit %:h<CR>
nnoremap [MyPrefix].v :<C-u>edit $MYVIMRC<Enter>
nnoremap [MyDoublePrefix].v :<C-u>source $MYVIMRC<Enter>:echo "source .vimrc"<Enter>
nnoremap [MyPrefix].p :<C-u>edit $HOME/vimfiles/snippets/<Enter>

" ---------- file ----------

nnoremap [MyPrefix]w             :<C-u>w<CR>
nnoremap [MyPrefix].w            :<C-u>w<CR>
nnoremap [MyPrefix].e            :<C-u>e .<CR>
nnoremap <silent> <C-w><C-e>     :<C-u>vs<CR>:<C-u>e .<CR>

nnoremap [MyPrefix]t             :<C-u>tabnew 
nnoremap [MyPrefix].t            :<C-u>tabnew .<CR>

" ---------- tab ----------

nnoremap <C-n>                   :<C-u>tabn<CR>
nnoremap <C-p>                   :<C-u>tabp<CR>
nnoremap [MyPrefix].d            :<C-u>bd<CR>

" ---------- grep ----------

nnoremap <expr> [MyPrefix].g      ':Ack ' . expand('<cword>')
nnoremap [MyDoublePrefix].g       :<C-u>Ack 

" ---------- substitute ----------

nnoremap <expr> [MyPrefix].s      ':%substitute/\<' . expand('<cword>') . '\>//gc<Left><Left><Left>'
nnoremap [MyDoublePrefix].s       :<C-u>%substitute///gc<Left><Left><Left><Left>

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

" source % の実行
command! SU :source %

" カレントファイルのディレクトリに移動 
command! -nargs=0 CdCurrent cd %:p:h

" 開発中pluginの再読込
command! ReloadThisPlugin execute("unlet g:loaded_".expand("%:t:r")) | execute("source ".expand("%"))
command! RT ReloadThisPlugin

" ctagsの実行（スクリプト名固定）
command! Ctags :!./maketags.sh

" カレントバッファのファイル名を変更 by vim-users.jp
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" FireFoxで開く
if has('win32') || has('win64')
"    if @%[0] != 'c'
        command! FireFox :silent !start firefox c:%<CR>
"    else
"        command! FireFox :silent !start firefox %<CR>
"    endif
else
    command! FireFox :silent !start firefox %<CR>
endif

" snipMate再読み込み snipMateへのカスタマイズ前提 
command! ReloadAllSnippets :call ReloadAllSnippets()

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
  autocmd BufWinEnter,BufNewFile *.vimperatorrc set filetype=vim
  " mayu
  autocmd BufWinEnter,BufNewFile *.mayu,*.nodoka set filetype=mayu
  " ujml
  autocmd BufWinEnter,BufNewFile *.ujml,*.ujmi,*.ent,*.ujmc set filetype=ujml
  " rspec
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  " puthon.test
  autocmd BufWinEnter,BufNewFile test*.py set filetype=python.test
  " hatena
  autocmd BufWinEnter,BufNewFile *.hatena set filetype=hatena
augroup END

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

nnoremap [MyPrefix].b             :<C-u>FufBuffer<CR>
nnoremap [MyPrefix].f             :<C-u>FufFile **/<CR>
nnoremap [MyPrefix].r             :<C-u>FufMruFile<CR>

" snipMate.vim

let g:snippets_dir = '$HOME/vimfiles/snippets'

" The-NERD-Commenter

map <space>x <plug>NERDCommenterToggle

" openbrowser.vim

nmap [MyPrefix]bs <Plug>(openbrowser-smart-search)
nmap [MyPrefix]bo <Plug>(openbrowser-open)

" ZenCoding.vim

let g:user_zen_settings = {
\  'indentation' : '  '
\}

" neocomplcache.vim

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

" <C-x><C-f>でneocomplcacheのファイル名補完を利用する 
inoremap <expr><C-x><C-f>  neocomplcache#manual_filename_complete()
" <C-n>でneocomplcacheのキーワード補完を利用する 
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : neocomplcache#manual_keyword_complete()

" }}}1

" quickrun settings {{{1

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

silent! map <unique> [MyPrefix]q <Plug>(quickrun)

" }}}1

cd ~/
