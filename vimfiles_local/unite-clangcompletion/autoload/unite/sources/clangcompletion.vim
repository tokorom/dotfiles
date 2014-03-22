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
  \ 'g:unite_source_clangcompletion_default_opts', '-cc1 -w -fblocks -D__IPHONE_OS_VERSION_MIN_REQUIRED=40300')
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
  call s:initialize(a:args, a:context)

  let tmp_filename = unite#util#substitute_path_separator(expand('%:p:h') . '/~' . expand('%:t'))
  call writefile(getline(1, '$'), tmp_filename)

  let text = getline('.')
  let line = line('.')
  let col = col('.')
  let a:context.source__filename = tmp_filename
  let a:context.source__line = line

  let space_idx = strridx(text, '[^a-zA-Z0-9_-]', col)
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
  if has_key(a:context, 'source__filename')
    call delete(a:context.source__filename)
  endif
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
    \ join(a:context.source__extra_opts, ' '),
    \ a:context.source__filename,
    \ string(a:context.source__line),
    \ string(a:context.source__col),
    \ a:context.source__filename,
    \ variables.suffix,
    \)

  if verbose
    call unite#print_source_message('Command-line: ' . cmdline, s:source.name)
  endif

  " debug
  if has_key(a:context, 'source__debugs') && 0 < len(a:context.source__debugs)
    let candidates = []
    for debug_string in a:context.source__debugs
      call add(candidates, {
            \ 'word' : debug_string,
            \ 'kind' : 'word',
            \})
    endfor
    return candidates
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
  return matchstr(getline('.'), '[a-zA-Z0-9_-]\+$')
endfunction "}}}

function! s:initialize(args, context) "{{{
  let a:context.source__extra_opts = []
  let a:context.source__debugs = []

  if executable('xcodebuild')
    let dic = {}
    let check_keys = [
      \ 'SDK_DIR',
      \ 'HEADER_SEARCH_PATHS',
      \ 'LIBRARY_SEARCH_PATHS',
      \ 'GCC_PREFIX_HEADER',
      \ 'CLANG_ENABLE_OBJC_ARC',
      \ 'CLANG_ENABLE_MODULES',
      \]
    let suffix = ' | grep ''^\s*\(' . join(check_keys, '\|') . '\)\s*=\s*'''
    let cmdline = 'xcodebuild -showBuildSettings' . suffix
    let lines = split(system(cmdline), "\n")
    for line in lines
      let line = substitute(line, '\(^\s\+\)\|\(\s\+$\)', '', 'g')
      let items = split(line, ' = ')
      if 1 < len(items)
        let [key, value] = split(line, ' = ')
        let dic[key] = value
      endif
    endfor

    let foptions = []
    let pchs = []
    let framework_paths = []
    let include_paths = []

    let key = 'SDK_DIR'
    if has_key(dic, key)
      call add(framework_paths,
        \ dic[key] . '/System/Library/Frameworks')
      call add(include_paths,
        \ dic[key] . '/usr/include')
    endif

    let key = 'HEADER_SEARCH_PATHS'
    if has_key(dic, key)
      let paths = split(dic[key], ' ')
      for path in paths
        if 0 > stridx(path, '*') && 0 > index(include_paths, path)
          call add(include_paths, path)
        endif
      endfor
    endif

    let key = 'LIBRARY_SEARCH_PATHS'
    if has_key(dic, key)
      let paths = split(dic[key], ' ')
      for path in paths
        if 0 > stridx(path, '*') && 0 > index(include_paths, path)
          call add(include_paths, path)
        endif
      endfor
    endif

    call add(include_paths, '/Users/ytokoro/develop/cookpad/ios-cookpad/Tsukuru/model')

    let key = 'GCC_PREFIX_HEADER'
    if has_key(dic, key)
      let pch = dic[key]
      if 0 > index(pchs, pch)
        call add(pchs, dic[key])
      endif
    endif

    let key = 'CLANG_ENABLE_OBJC_ARC'
    if has_key(dic, key)
      let value = 'objc-arc'
      if 'NO' == dic[key]
        let value = 'no-' . value
      endif
      if 0 > index(foptions, value)
        call add(foptions, value)
      endif
    endif

    let key = 'CLANG_ENABLE_MODULES'
    if has_key(dic, key)
      let value = 'modules'
      if 'NO' == dic[key]
        let value = 'no-' . value
      endif
      if 0 > index(foptions, value)
        call add(foptions, value)
      endif
    endif

    for foption in foptions
      call add(a:context.source__extra_opts, '-f' . foption)
    endfor
    for path in pchs
      call add(a:context.source__extra_opts, '-include ' . path)
    endfor
    for path in framework_paths
      call add(a:context.source__extra_opts, '-F' . path)
    endfor
    for path in include_paths
      call add(a:context.source__extra_opts, '-I' . path)
    endfor
  endif
endfunction "}}}

" vim: foldmethod=marker
