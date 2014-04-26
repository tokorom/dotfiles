" neocomplete-ios-dictionary - neocomplete settings for ios's dictionary {{{
" Version: 0.0.1
" Copyright (C) 2014 Yuta ToKoRo <https://github.com/tokorom/>
" Last Modified: April 27, 2014
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

let s:spath = expand('<sfile>:p')

function! neocomplete_ios_dictionary#configure_ios_dict()
  if !exists('g:neocomplete#sources#dictionary#dictionaries')
    let g:neocomplete#sources#dictionary#dictionaries = {}
  endif
  let spath = s:spath
  let dictpath = spath[0 : strridx(spath, 'autoload') - 1] . 'dict/ios.dict'
  let g:neocomplete#sources#dictionary#dictionaries.objc = dictpath
endfunction

function! neocomplete_ios_dictionary#configure_dictionary_source()
  let sources = neocomplete#helper#get_sources_list()
  if has_key(sources, 'dictionary')
    let dictionary_source = sources['dictionary']

    function! dictionary_source.get_complete_position(context) "{{{
      let filetype = neocomplete#get_context_filetype()
      if 'objc' == filetype
        let line = a:context.input
        if 0 == match(line, '^[-+]')
          return 0
        else
          let idx = match(line, '\h\w*$')
          return idx
        endif
      else
        return neocomplete#helper#match_word(a:context.input,
        \ neocomplete#get_keyword_pattern_end(filetype, 'dictionary'))[0]
      endif
    endfunction

    let dictionary_source.keyword_patterns = {}
    let dictionary_source.keyword_patterns.objc = '^\(\h[:_0-9a-zA-Z]*\|[-+].*\)'
  endif
endfunction

function! neocomplete_ios_dictionary#remove_unuse_sources_for_objc()
  let sources = neocomplete#helper#get_sources_list()
  let unuse_sources = ['member', 'tag', 'syntax', 'include', 'vim', 'omni']
  for source_name in unuse_sources
    if has_key(sources, source_name)
      let source = sources[source_name]
      if !exists('source.disabled_filetypes')
        let source.disabled_filetypes = {}
      endif
      let source.disabled_filetypes.objc = 1
    endif
  endfor
endfunction

" Fin. "{{{
" __END__
" vim: foldmethod=marker
