function! s:on_load_pre()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *before* a plugin is loaded.
  let g:neocomplete#enable_at_startup = 1 "自動起動
  inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : neocomplete#start_manual_complete()
  inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr> <C-g> neocomplete#undo_completion()
  imap <C-k> <Plug>(neocomplete_start_unite_complete)<Esc>A
endfunction

function! s:on_load_post()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *after* a plugin is loaded.
  let g:neocomplete#disable_auto_complete = 1 "自動補完をしない
  let g:neocomplete#auto_completion_start_length = 3 "自動補完開始は3文字打鍵した後
  let g:neocomplete#enable_smart_case = 1 "大文字小文字無視
  let g:neocomplete#max_list = 10000 "候補の最大数
  let g:neocomplete#enable_auto_select = 0 "第一候補を自動選択しない
  let g:neocomplete#enable_fuzzy_completion = 0 "Fuzzy補完しない

  autocmd FileType vim,swift let g:neocomplete#disable_auto_complete = 0 "一部のfiletypeでは自動補完を有効にする

  let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : ''
  \ }

  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
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

  return ['github.com/Shougo/context_filetype.vim']
endfunction
