"=============================================================================
" FILE: clangcompletion.vim
" AUTHOR: Yuta ToKoRo <tokorom at gmail.com>
" Last Modified: 2014-03-22.
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

" Variables "{{{
call unite#util#set_default(
  \ 'g:unite_source_clangcompletion_command', 'clang')
call unite#util#set_default(
  \ 'g:unite_source_clangcompletion_default_opts', '-cc1 -w -fblocks -fobjc-arc -D__IPHONE_OS_VERSION_MIN_REQUIRED=40300 -include ./Tsukuru/Tsukuru-Prefix.pch -F/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks -I/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/include')
call unite#util#set_default(
  \ 'g:unite_source_clangcompletion_suffix', '2> /dev/null | grep ''^COMPLETION: '' | cut -c13-')
"}}}

function! unite#sources#clangcompletion#define() "{{{
  return s:source
endfunction "}}}

let s:source = {
  \ 'name' : 'clangcompletion',
  \ 'hooks' : {},
  \ 'variables' : {
  \   'command' : g:unite_source_clangcompletion_command,
  \   'default_opts' : g:unite_source_clangcompletion_default_opts,
  \   'suffix' : g:unite_source_clangcompletion_suffix,
  \ },
  \}

function! s:source.hooks.on_init(args, context) "{{{
  let tmp_filename = unite#util#substitute_path_separator(expand('%:p:h') . '/~' . expand('%:t'))
  call writefile(getline(1, '$'), tmp_filename)

  let text = getline('.')
  let line = line('.')
  let col = col('.')
  let a:context.source__extra_opts = ''
  let a:context.source__filename = tmp_filename
  let a:context.source__line = line

  let space_idx = strridx(text, ' ', col)
  let dot_idx = strridx(text, '.', col)
  let colon_idx = strridx(text, ':', col)
  let sep_idx = max([space_idx, dot_idx, colon_idx])
  if 0 < sep_idx
    let compl_idx = sep_idx + 1
  else 
    let compl_idx = col
  endif

  let a:context.source__col = compl_idx
  let a:context.source__before_text = text[ : max([compl_idx - 1, 0])]
  let a:context.source__after_text = text[col : ]
endfunction "}}}

function! s:source.hooks.on_close(args, context) "{{{
  call delete(a:context.source__filename)
endfunction "}}}

function! s:source.gather_candidates(args, context) "{{{
  let verbose = a:context.verbose
  let variables = unite#get_source_variables(a:context)

  if !executable(variables.command)
    call unite#print_source_message(printf(
          \ 'command "%s" is not executable.',
          \ variables.command), s:source.name)
    return []
  endif

  let cmdline = printf('%s %s %s -code-completion-at=%s:%s:%s %s %s',
    \ unite#util#substitute_path_separator(variables.command),
    \ variables.default_opts,
    \ a:context.source__extra_opts,
    \ a:context.source__filename,
    \ string(a:context.source__line),
    \ string(a:context.source__col),
    \ a:context.source__filename,
    \ variables.suffix,
    \)

  if verbose
    call unite#print_source_message('Command-line: ' . cmdline, s:source.name)
  endif

  let lines = split(system(cmdline), "\n")
  if 0 == len(lines)
    return []
  endif

  let candidates = []
  for line in lines
    let space_idx = stridx(line, ' ')
    let compl = line[0 : space_idx - 1]
    call add(candidates, {
      \ 'word' : a:context.source__before_text . compl . a:context.source__after_text,
      \ 'abbr' : line,
      \ 'kind' : 'word',
      \})
  endfor

  return candidates
endfunction "}}}

function! unite#sources#clangcompletion#get_cur_text() "{{{
  let text =  unite#get_cur_text()
  let col = col('.')

  let space_idx = strridx(text, ' ', col)
  let dot_idx = strridx(text, '.', col)
  let colon_idx = strridx(text, ':', col)
  let sep_idx = max([space_idx, dot_idx, colon_idx])
  if 0 < sep_idx
    return text[sep_idx : ]
  else
    return text
  endif
endfunction "}}}

" vim: foldmethod=marker
