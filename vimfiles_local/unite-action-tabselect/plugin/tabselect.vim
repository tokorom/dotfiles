"=============================================================================
" FILE: tabselect.vim
" AUTHOR: Yuta ToKoRo <tokorom at gmail.com>
" Last Modified: 2014-03-23.
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
"=============================================================================

" Defaults "{{{

let s:action = {
\   'is_selectable' : 0,
\}

"}}}

function! s:action.func(candidate) "{{{
  let candidate = a:candidate
  let tab_idx = s:find_tab(candidate)
  if 0 < tab_idx
    if has_key(candidate, 'action__line')
      call unite#take_action('tabopen', [candidate])
      call s:close_tab(tab_idx)
    else
      call s:select_tab(tab_idx)
    endif
  else 
    call unite#take_action('tabopen', [candidate])
  endif
endfunction "}}}

call unite#custom#action('file', 'tabselect', s:action)
unlet s:action

" Private methods "{{{

function! s:find_tab(candidate) "{{{
  let candidate = a:candidate
  let tab_count = tabpagenr('$')
  let tab_idx = 1
  while tab_idx <= tab_count
    let buf_idxes = tabpagebuflist(tab_idx)
    for buf_idx in buf_idxes
      let path = candidate.action__path
      if fnamemodify(buffer_name(buf_idx), ':p') == fnamemodify(path, ':p')
        return tab_idx
      endif
    endfor
    let tab_idx = tab_idx + 1
  endwhile
  return -1
endfunction "}}}

function! s:select_tab(idx) "{{{
  let idx = a:idx
  execute 'normal! ' . string(idx) . 'gt'
endfunction "}}}

function! s:close_tab(idx) "{{{
  let idx = a:idx
  execute ':tabclose ' . string(idx)
endfunction "}}}

"}}}

" vim: foldmethod=marker
