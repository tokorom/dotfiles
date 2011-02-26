" File: myopengl.vim
" Author: Yuta Tokoro
" Version: 0.1
" Last Modified: 2009/01/24
"
" Overview
" --------
" define the function for the openGL 
"

if exists('loaded_my_opengl')
    finish
endif
let loaded_my_opengl=1

au BufRead *.m,*.mm,*.h,*.hpp,*.c,*.cpp,*.cc if search('^#i.*gl','n')>0|call OpenGL()|endif

function! OpenGL() range
    if exists('loaded_my_opengl_setting')
        finish
    endif
    let loaded_my_opengl_setting=1

    " load the syntax file 
    source ~/vimfiles/after/syntax/opengl.vim

    " add keyword file
    set complete+=k~/vimfiles/keyword/opengl.dict

endfunction
command! OpenGL :call OpenGL()

