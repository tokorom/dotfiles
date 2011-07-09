" OmniCppComplete setting

" 初期化
"call omni#cpp#complete#Init()

" プレビューウィンドウを表示しない
setlocal completeopt -=preview

" --- altr settings ---

call altr#remove_all()
call altr#define('%.h', '%.c')

" 自動補完を解除
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0

" 最初のItemを自動で選択しない
let OmniCpp_SelectFirstItem = 2

