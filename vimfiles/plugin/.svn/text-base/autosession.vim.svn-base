" File: autosession.vim
" Author: Yuta Tokoro
" Version: 0.5.0
" Last Modified: 2009-05-10
"
" Overview
" --------
" This plugin executes 'mksession', when you finish your Vim.
"

if exists('loaded_autosession')
  finish
endif
let loaded_autosession=1

" --------------------------------
" initialize

if !exists('g:autosession_session_filename')
  let g:autosession_session_filename = "~/lastsession_by_autosession.tmp"
endif

if !exists('g:autosession_one_session_filename')
  let g:autosession_one_session_filename = "~/onesession_by_autosession.tmp"
endif

if !exists('g:autosession_auto_save')
  let g:autosession_auto_save = 1
endif

if !exists('g:autosession_auto_load')
  let g:autosession_auto_load = 0
endif

" --------------------------------
" functions

" load the last session
command! LoadLastSession :call LoadSession(g:autosession_session_filename)
command! LLS :call LoadSession(g:autosession_session_filename)

" save a session
function! SaveSession(...)
  let l:filename = 0 < a:0 ? expand(a:1) : expand(g:autosession_one_session_filename)

  exe "mks! " . l:filename
endfunction
command! -nargs=? SaveSession :call SaveSession(<f-args>)
command! -nargs=? SS :call SaveSession(<f-args>)

" load a session
function! LoadSession(...)
  let l:filename = 0 < a:0 ? expand(a:1) : expand(g:autosession_one_session_filename)

  silent only
  silent tabonly
  if ( filereadable( l:filename ) )
    exe "source " . l:filename
  else
    echoerr "autosession.vim: " . l:filename . " is not readable"
  endif
endfunction
command! -nargs=? LoadSession :call LoadSession(<f-args>)
command! -nargs=? LS :call LoadSession(<f-args>)

" --------------------------------
" auto save

if ( 1 == g:autosession_auto_save )
  au VimLeave * call SaveSession(g:autosession_session_filename)
endif

" --------------------------------
" auto load

if ( 1 == g:autosession_auto_load )
  au VimEnter * call LoadSession(g:autosession_session_filename)
endif

