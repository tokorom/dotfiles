" urldecoder - The utility for url encode/decode {{{
" Version: 0.0.1
" Copyright (C) 2014 Yuta ToKoRo <https://github.com/tokorom/>
" Reference: https://github.com/koron/chalice
" Required: tr, nkf, jq
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

" Public functions "{{{

function urldecoder#urlencode_and_replace_line() "{{{
  let line = getline('.')
  let encoded = s:urlencode(line)
  call setline('.', encoded)
endfunction "}}}

function urldecoder#urldecode_and_replace_line() "{{{
  let line = getline('.')
  let encoded = s:urldecode(line)
  call setline('.', encoded)
endfunction "}}}

function urldecoder#ucndecode_and_replace_line() "{{{
  let line = getline('.')
  let encoded = s:ucndecode(line)
  call setline('.', encoded)
endfunction "}}}

"}}}

" Private functions {{{

function! s:urlencode(line) "{{{
  if !executable('nkf')
    echoerr 'nkf command was not found.'
  endif
  if !executable('tr')
    echoerr 'tr command was not found.'
  endif
  let l:line = '"' . s:escape(a:line) . '"'
  let encoded = system('echo ' . l:line . ' | nkf -WwMQ | tr = %')
  return s:join(s:strip(encoded))
endfunction "}}}

function! s:urldecode(line) "{{{
  if !executable('nkf')
    echoerr 'nkf command was not found.'
  endif
  let l:line = '"' . s:escape(a:line) . '"'
  let encoded = system('echo ' . l:line . ' | nkf --url-input')
  return s:strip(encoded)
endfunction "}}}

function! s:ucndecode(line) "{{{
  if !executable('jq')
    echoerr 'jq command was not found.'
  endif
  let l:line = '''"' . s:escape_for_ucn(a:line) . '"'''
  let encoded = system('echo ' . l:line . ' | jq .')
  return s:strip_for_ucn(encoded)
endfunction "}}}

function! s:escape(string) "{{{
  return substitute(a:string, '"', '\\"', 'g')
endfunction "}}}

function! s:strip(string) "{{{
  return substitute(a:string, '^[\s\r\n]*\(.\{-}\)[\s\r\n]*$', '\1', '')
endfunction "}}}

function! s:join(string) "{{{
  return substitute(a:string, '%[\r\n]', '', 'g')
endfunction "}}}

function! s:escape_for_ucn(string) "{{{
  let ret = substitute(a:string, "'", "''", 'g')
  return substitute(ret, '"', '\\"', 'g')
endfunction "}}}

function! s:strip_for_ucn(string) "{{{
  let ret = substitute(a:string, '\\"', '"', 'g')
  return substitute(ret, '^[\s\r\n]*"\(.\{-}\)"[\s\r\n]*$', '\1', '')
endfunction "}}}

"}}}

" Fin. "{{{
" __END__
" vim: foldmethod=marker
