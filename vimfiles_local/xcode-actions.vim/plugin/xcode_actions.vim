" xcode-actions.vim - Operate Xcode from Vim {{{
" Version: 0.0.1
" Copyright (C) 2014 Yuta ToKoRo <https://github.com/tokorom/>
" Last Modified: April 28, 2014
" License: MIT license {{{
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
" OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
" CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
" TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
" SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" }}}

if exists('g:loaded_xcode_actions') "{{{
  finish
endif "}}}

command! XcodeActionsBuild    :call xcode_actions#build()
command! XcodeActionsRun      :call xcode_actions#run()
command! XcodeActionsClean    :call xcode_actions#clean()
command! XcodeActionsTest     :call xcode_actions#test()
command! XcodeActionsOpenFile :call xcode_actions#openfile(xcode_actions#current_file())

nnoremap <silent> <Plug>(xcode-actions-build)      :<C-u>XcodeActionsBuild<Return>
nnoremap <silent> <Plug>(xcode-actions-run)        :<C-u>XcodeActionsRun<Return>
nnoremap <silent> <Plug>(xcode-actions-clean)      :<C-u>XcodeActionsClean<Return>
nnoremap <silent> <Plug>(xcode-actions-test)       :<C-u>XcodeActionsTest<Return>
nnoremap <silent> <Plug>(xcode-actions-openfile)   :<C-u>XcodeActionsOpenFile<Return>

" Fin. "{{{

let g:loaded_xcode_actions = 1

" __END__
" vim: foldmethod=marker
