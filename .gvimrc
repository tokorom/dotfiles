" ########## gvimrc ##########

" クリップボードをOSと連携
set clipboard=unnamed

" ウィンドウのサイズ設定
if has("win32")
    au GUIEnter * set lines=45
    au GUIEnter * set columns=150
else
    au GUIEnter * set lines=50
    au GUIEnter * set columns=200
endif

" menu setting
set guioptions-=T "ツールバーなし
set guioptions-=m "メニューバーなし
"set guioptions-=r "右スクロールバーなし
set guioptions-=R
set guioptions-=l "左スクロールバーなし
set guioptions-=L
set guioptions-=b "下スクロールバーなし

if has("win32")

    " Windows用設定
    set guifont=MS_Gothic:h10:cSHIFTJIS 

elseif has("mac")

    " MacVim用設定
    set guifont=Monaco:h12

endif

"カラースキーマを設定
colorscheme neon
