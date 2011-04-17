" File: quickrun_switcher.vim
" Version: 0.0.1
" Author: tokorom
" Description: nosetests with quickrun.vim
" Last Change: 2011-04-18.
"
"=============================================================================
" load guard {{{1

if exists('loaded_quickrun_switcher') || &cp || version < 700
  finish
endif
let g:loaded_quickrun_switcher = 1

" }}}1
"=============================================================================
" gloval variables {{{1

" this is samples for python
" --------------------------------
"let g:quickrun_switcher_config['python.unit']['all'] = {'command': 'nosetests', 'exec': ['%c -v %s']}
"let g:quickrun_switcher_config['python.unit']['one'] = {'command': 'nosetests', 'exec': ['%c -v %s:{QuickNoseGetCurrentTestCase()}']}
" --------------------------------

" }}}1
"=============================================================================
" key mapping {{{1

" execute a current test
nnoremap <silent> <Space>..
\ :call QuickrunSwitcherTestCurrentTestCase()<Return>

" execute all tests
nnoremap <silent> <Space>.a
\ :call QuickrunSwitcherTestAll()<Return>

" }}}1
"=============================================================================
" public functions {{{1

function! QuickrunSwitcherTestCurrentTestCase()
  let filetype = s:GetFileType()
  let g:quickrun_config[filetype] = s:GetQuickrunSwitcherConfig(filetype, 'one')
  :QuickRun
endf

function! QuickrunSwitcherTestAll()
  let filetype = s:GetFileType()
  let g:quickrun_config[filetype] = s:GetQuickrunSwitcherConfig(filetype, 'all')
  :QuickRun
endf

" }}}1
"=============================================================================
" private functions {{{1

function! s:GetFileType()
  return &filetype
endf

function! s:GetQuickrunSwitcherConfig(filetype, switch)
  if 1 == s:QuickrunSwitcherConfigIsExists(a:filetype, a:switch)
    return g:quickrun_switcher_config[a:filetype][a:switch]
  elseif 'all' != a:switch && 1 == s:QuickrunSwitcherConfigIsExists(a:filetype, 'all')
    return g:quickrun_switcher_config[a:filetype]['all']
  elseif exists("g:quickrun_config")
    if has_key(g:quickrun_config, a:filetype)
      return g:quickrun_config[a:filetype]
    endif
  else
    return g:quickrun_default_config[a:filetype]
  endif
endf

function! s:QuickrunSwitcherConfigIsExists(filetype, switch)
  if !exists("g:quickrun_switcher_config")
    return 0
  endif
  if !has_key(g:quickrun_switcher_config, a:filetype)
    return 0
  endif
  if !has_key(g:quickrun_switcher_config[a:filetype], a:switch)
    return 0
  endif
  return 1
endfunction

" }}}1
