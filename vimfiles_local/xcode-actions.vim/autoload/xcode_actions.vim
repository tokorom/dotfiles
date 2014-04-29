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

" initialize "{{{

let spath = expand('<sfile>:p')
let s:xcode_actions_script = spath[0 : strridx(spath, 'autoload') - 1] . 'bin/xcode_actions'

"}}}

" public functions "{{{

function! xcode_actions#build() "{{{
  call s:execute_xcode_actions_script('build', '')
endfunction "}}}

function! xcode_actions#run() "{{{
  call s:execute_xcode_actions_script('run', '')
endfunction "}}}

function! xcode_actions#clean() "{{{
  call s:execute_xcode_actions_script('clean', '')
endfunction "}}}

function! xcode_actions#test() "{{{
  call s:execute_xcode_actions_script('test', '')
endfunction "}}}

function! xcode_actions#openfile(filename) "{{{
  call s:execute_xcode_actions_script('openfile', a:filename)
endfunction "}}}

function! xcode_actions#current_file() "{{{
  let filename = expand('%:t')
  let line = line('.')
  return filename . ':' . line
endfunction "}}}

"}}}

" private functions "{{{

function! s:execute_xcode_actions_script(action, arg) "{{{
  let command = s:xcode_actions_script . ' ' . a:action . ' ' . a:arg
  call system(command)
endfunction "}}}

"}}}

" Fin. "{{{
" __END__
" vim: foldmethod=marker
