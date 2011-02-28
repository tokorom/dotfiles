" File: zunit.vim
" Version: 0.0.1
" Author: tokorom
" Description: unit test assistant
" Last Modified: February 13, 2011

"=============================================================================
" load guard {{{1

if exists('loaded_zunit') || &cp || version < 700
  finish
endif
let g:loaded_zunit = 1

" }}}1
"=============================================================================
" gloval variables {{{1

let g:zunit_make = 'make'
let g:zunit_filepath_home = '$HOME/vimfiles/zunit/'
let g:zunit_completion_funcname = 'ZUnitParse'

" }}}1
"=============================================================================
" aurgoup {{{1

augroup zunit
  autocmd!
  " for python
  autocmd FileType python let g:zunit_compiler= 'nose'
  autocmd FileType python let g:zunit_find_sourcefile_regex= []
  autocmd FileType python call add( g:zunit_find_sourcefile_regex, ['test[/\\]', ''] )
  autocmd FileType python call add( g:zunit_find_sourcefile_regex, ['test', ''] )
  autocmd FileType python let g:zunit_find_testfile_regex = []
  autocmd FileType python call add( g:zunit_find_testfile_regex, ['[^/\\]*\.py', 'test\0'] )
  autocmd FileType python let g:zunit_parse_setting = fnameescape(expand(g:zunit_filepath_home.'zunit_python.py'))
  " for ruby.rspec
  autocmd FileType ruby let g:zunit_compiler= 'rspec'
  autocmd FileType ruby let g:zunit_find_sourcefile_regex= []
  autocmd FileType ruby call add( g:zunit_find_sourcefile_regex, ['_spec\.', '.'] )
  autocmd FileType ruby let g:zunit_find_testfile_regex = []
  autocmd FileType ruby call add( g:zunit_find_testfile_regex, ['\.rb', '_spec\0'] )
  " end
augroup END

" }}}1
"=============================================================================
" key mapping {{{1

" zunit prefix key
nmap <Space>z <Plug>(zunit-prefix)
nnoremap <silent> <Plug>(zunit-prefix) <Nop>

" execute tests
nnoremap <silent> <Plug>(zunit-prefix)m
\ :call ZUnitMake()<Return>

" UnitText <--> Source
nnoremap <silent> <Plug>(zunit-prefix)z
\ :call ZUnitToggleFile()<Return>

" completion
nnoremap <silent> <Plug>(zunit-prefix)o
\ :call ZUnitCompletion()<Return>

" }}}1
"=============================================================================
" public functions {{{1

function! ZUnitMake()
  call ZUnitFindTestFileIfFound()
  execute('compiler '.g:zunit_compiler)
  make 
endfunction

function! ZUnitToggleFile()
  let fname = bufname('%')
  let found = 0
  for regex in g:zunit_find_sourcefile_regex
    if 0 <= match(fname, regex[0])
      let found = 1
      break
    endif
  endfor
  if 0 < found
    call ZUnitFindSourceFile()
  else
    call ZUnitFindTestFile()
  endif
endfunction

function! ZUnitFindTestFile()
  let path = s:substitutePath(g:zunit_find_testfile_regex)
  call s:openTab(path)
endfunction

function! ZUnitFindTestFileIfFound()
  let fname = bufname('%')
  let found = 0
  for regex in g:zunit_find_sourcefile_regex
    if 0 <= match(fname, regex[0])
      let found = 1
      break
    endif
  endfor
  if 0 < found
  else
    call ZUnitFindTestFile()
  endif
endfunction

function! ZUnitFindSourceFile()
  let path = s:substitutePath(g:zunit_find_sourcefile_regex)
  call s:openTab(path)
endfunction

function! ZUnitCompletion()
  if filereadable(g:zunit_parse_setting)
    let line = getline('.')
    if -1 < match(g:zunit_parse_setting, '\.py$')
      let path = fnamemodify(g:zunit_parse_setting, ':p:h')
      let module = fnamemodify(g:zunit_parse_setting, ':t:r')
      if exists('g:zunit_completion_funcname') && 0 < strlen(g:zunit_completion_funcname)
        let funcname = g:zunit_completion_funcname
      else
        let funcname = 'ZUnitParse'
      endif
python <<EOM
import vim, sys
sys.path.append(vim.eval('path'))
exec 'import '+vim.eval('module')
exec 'reload('+vim.eval('module')+')'
exec 'ret = '+vim.eval('module')+'.'+vim.eval('funcname')+'(r"'+vim.eval('line')+'")'
vim.command('let ret = "'+ret+'"')
EOM
    else
      source g:zunit_parse_setting
      execute('let ret = ZUnitParse('.line.')')
    endif
    echo ret
    call setreg('*', ret, 'l')
  else
    echo 'file not found: '.g:zunit_parse_setting
  endif
endfunction

" }}}1
"=============================================================================
" private functions {{{1

function! s:substitutePath(list)
  let fname = bufname('%')
  for regex in a:list
    let fname = substitute(fname, regex[0], regex[1], '')
  endfor
  if !bufloaded(fname)
    let fname = input('SourceFile: ', fname, 'file')
  endif
  return fname
endfunction

function! s:openTab(path)
  let opened = 0
  let bufNr = bufnr('^'.a:path.'$')
  if -1 < bufNr && bufloaded(a:path)
    let opened = l9#moveToBufferWindowInCurrentTabpage(bufNr)
  endif
  if 1 > opened
    let opened = l9#moveToBufferWindowInOtherTabpage(bufNr)
  endif
  if 1 > opened
    execute("vsplit " . fnameescape(fnamemodify(a:path, ':~:.')))
  endif
endfunction

" }}}1
