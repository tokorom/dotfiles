" File: myobjc.vim
" Author: Yuta Tokoro
" Version: 0.1
" Last Modified: 2009/01/12
"
" Overview
" --------
" define the function that change filetype to 'objc'
"

if exists('loaded_my_objc')
    finish
endif
let loaded_my_objc=1

augroup filetypedetect
au! BufRead *.m,*.mm call ChangeFiletypeToObjectiveC()
au! BufRead *.h,*.hpp,*.c,*.cpp,*.cc if exists('loaded_my_objc_setting') || search('^#import','n')>0|call ChangeFiletypeToObjectiveC()|endif
augroup END

" change filetype to 'objc'
function! ChangeFiletypeToObjectiveC()
    " change filetype to a current buffer
    set filetype=objc
    " change filetype automatically to all objc buffers 
    augroup filetypedetect
    au! BufRead,BufNewFile *.h,*.m,*.mm setfiletype objc
    augroup END

    if exists('loaded_my_objc_setting')
        finish
    endif
    let loaded_my_objc_setting=1

    let g:filetype_m = 'objc'

    " add keyword file
    set complete+=k~/vimfiles/keyword/objc_types.dict

    " add tags
    set tags=tags,TAGS,~/vimfiles/tags/iphone_sdk_4_0_objc.tags,~/vimfiles/tags/iphone_sdk_4_0_c.tags

    " for make
    set makeprg=xcodebuild\ -activeconfiguration 

    " for a.vim
    let g:alternateExtensions_h = "m,mm,c,cpp"
    let g:alternateExtensions_m = "h"
    let g:alternateExtensions_mm = "h,hpp"

endfunction
command! ObjectiveC :call ChangeFiletypeToObjectiveC()

" create Objective-C class ( XXXX.h & XXXX.m )
function! CreateObjectiveCClass( fname ) 
    execute ":tabnew " . a:fname . ".m"
    execute ":e " . a:fname . ".h"
endfunction
command! -nargs=1 CreateObjectiveCClass :call CreateObjectiveCClass(<f-args>)

