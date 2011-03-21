" ########## keymap.vim ##########

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

noremap  <silent> <C-a>    <Esc>:<C-u>MoveToZero<CR>

" -- exchange source <--> header --

nnoremap [MyPrefix]a             :<C-u>A<CR>
nnoremap [MyDoublePrefix]a       :<C-u>vs<CR><C-w><C-w>:<C-u>A<CR>

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
nnoremap [MyPrefix].k :<C-u>edit $HOME/vimfiles/keybinding.vim<Enter>
nnoremap [MyPrefix].n :<C-u>edit $HOME/dot.nodoka<Enter>
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

nnoremap <expr> [MyPrefix].g      ':%vimgrep/\<' . expand('<cword>') . '\>/ **/*'
nnoremap [MyDoublePrefix].g       :<C-u>vimgrep // **/*<Left><Left><Left><Left><Left><Left>

" ---------- substitute ----------

nnoremap <expr> [MyPrefix].s      ':%substitute/\<' . expand('<cword>') . '\>//gc<Left><Left><Left>'
nnoremap [MyDoublePrefix].s       :<C-u>%substitute///gc<Left><Left><Left><Left>

" ---------- buffer ----------

nnoremap [MyPrefix]j       :<C-u>bn<CR>
nnoremap [MyPrefix]k       :<C-u>bp<CR>

" ---------- FuzzyFinder ----------

nnoremap [MyPrefix].b             :<C-u>FufBuffer<CR>
nnoremap [MyPrefix].f             :<C-u>FufFile **/<CR>
nnoremap [MyPrefix].r             :<C-u>FufMruFile<CR>

" ---------- for Commentify ----------

map      [MyPrefix]x               \x

" ---------- for QuickRun ----------

silent! map <unique> [MyPrefix]q <Plug>(quickrun)

