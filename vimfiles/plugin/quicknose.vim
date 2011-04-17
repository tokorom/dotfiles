" File: quicknose.vim
" Version: 0.0.1
" Author: tokorom
" Description: nosetests with quickrun.vim
" Last Change: 2011-04-17.
"
"=============================================================================
" load guard {{{1

if exists('loaded_quicknose') || &cp || version < 700
  finish
endif
let g:loaded_quicknose = 1

" }}}1
"=============================================================================
" gloval variables {{{1

let g:quicknose_filepath_home = '$HOME/vimfiles/plugin/quicknose/'
let g:quicknose_parse_setting = fnameescape(expand(g:quicknose_filepath_home.'quicknose.py'))
let g:quicknose_get_current_testcase = 'QuickNoseGetCurrentTestCase'

" }}}1
"=============================================================================
" public functions {{{1

function! QuickNoseGetCurrentTestCase()
  if filereadable(g:quicknose_parse_setting)
    let line = line('.')
    if -1 < match(g:quicknose_parse_setting, '\.py$')
      let path = fnamemodify(g:quicknose_parse_setting, ':p:h')
      let module = fnamemodify(g:quicknose_parse_setting, ':t:r')
      if exists('g:quicknose_completion_funcname') && 0 < strlen(g:quicknose_completion_funcname)
        let funcname = g:quicknose_get_current_testcase
      else
        let funcname = 'QuickNoseGetCurrentTestCase'
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
      source g:quicknose_parse_setting
      execute('let ret = QuickNoseGetCurrentTestCase('.line.')')
    endif
    return ret
  else
    echo 'file not found: '.g:quicknose_parse_setting
    return ''
  endif
endf

" }}}1
"=============================================================================
" private functions {{{1


" }}}1
