function! s:on_load_pre()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *before* a plugin is loaded.
  let g:fzf_command_prefix = 'Fzf'
  let g:fzf_layout = { 'up': '~40%' }

  nnoremap [MyPrefix].f :<C-u>FzfFiles<CR>
  nnoremap <C-f>        :<C-u>FzfFiles<CR>
  nnoremap [MyPrefix].b :<C-u>FzfBuffers<CR>
  nnoremap <C-b>        :<C-u>FzfBuffers<CR>
  nnoremap [MyPrefix].r :<C-u>FzfHistory<CR>
  nnoremap [MyPrefix].p :<C-u>FzfFiles ~/volt/plugconf<CR>
  nnoremap [MyPrefix].l :<C-u>FzfLines<CR>
  nnoremap [MyPrefix].h :<C-u>FzfHelptags<CR>
  nnoremap [MyPrefix].g :<C-u>FzfGFiles<CR>
  nnoremap [MyPrefix].s :<C-u>FzfFiles $VIMHOME/snippets/<CR>
  nnoremap <expr> [MyPrefix].g ':FzfAg ' . expand('<cword>')
endfunction

function! s:on_load_post()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *after* a plugin is loaded.
endfunction

function! s:loaded_on()
  " This function determines when a plugin is loaded.
  "
  " Possible values are:
  " * 'start' (a plugin will be loaded at VimEnter event)
  " * 'filetype=<filetypes>' (a plugin will be loaded at FileType event)
  " * 'excmd=<excmds>' (a plugin will be loaded at CmdUndefined event)
  " <filetypes> and <excmds> can be multiple values separated by comma.
  "
  " This function must contain 'return "<str>"' code.
  " (the argument of :return must be string literal)

  return 'start'
endfunction

function! s:depends()
  " Dependencies of this plugin.
  " The specified dependencies are loaded after this plugin is loaded.
  "
  " This function must contain 'return [<repos>, ...]' code.
  " (the argument of :return must be list literal, and the elements are string)
  " e.g. return ['github.com/tyru/open-browser.vim']

  return ['github.com/junegunn/fzf']
endfunction
