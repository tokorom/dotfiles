" textobj-objc - Text objects for Objective-C literals and blocks
" Version: 0.0.1
" Copyright (C) 2014 Yuta ToKoRo <https://github.com/tokorom/>
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

if exists('g:loaded_textobj_objc') "{{{1
  finish
endif

" Interface "{{{1

call textobj#user#plugin('objc', {
\   'literals': {
\     'select-a-function': 'textobj#objc#select_literal_a',
\     'select-i-function': 'textobj#objc#select_literal_i',
\     'select-a': 'a@',
\     'select-i': 'i@',
\   },
\
\   'blocks': {
\     'pattern': ['\^{[[:space:][:return:]\n]*', '[[:space:][:return:]\n]*}'],
\     'select-a': 'a^',
\     'select-i': 'i^',
\   }
\ })

" \     'pattern': ['[[:alnum:]-_]+:[[:space:][:return:]\n]*', '[^[:alnum:]-_]'],
" Fin. "{{{1

let g:loaded_textobj_objc = 1

" __END__
" vim: foldmethod=marker
