function! s:on_load_pre()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *before* a plugin is loaded.
  nnoremap [MyPrefix].f :<C-u>Unite -start-insert buffer file_rec file/new<CR>
  nnoremap [MyPrefix].b :<C-u>Unite -start-insert buffer<CR>
  nnoremap [MyPrefix].r :<C-u>Unite -start-insert file_mru<CR>
  nnoremap [MyPrefix].c :<C-u>Unite -start-insert codic<CR>
endfunction

function! s:on_load_post()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *after* a plugin is loaded.
  let g:unite_update_time = 50

  call unite#custom_source('file_rec', 'ignore_pattern', '\%(^\|/\)\%(build\|te?mp\)/\|\.\%(build\|git\)/\|\.\%(DS_Store\|o\|exe\|dll\|bak\|sw[po]\|class\|d\|dia\|gcda\|gcno\|png\|gif\|jpe?g\)$')

  " use `ag` for grep
  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--smart-case --nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_max_candidates = 0
  endif

  " close preview window
  autocmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    nnoremap <silent><buffer><expr> c
          \ empty(filter(range(1, winnr('$')),
          \ 'getwinvar(v:val, "&previewwindow") != 0')) ?
          \ unite#do_action('preview') : ":\<C-u>pclose!\<CR>"
    nmap <silent><buffer> <Esc> <Plug>(unite_exit)
    nmap <silent><buffer> / i<Space>
    nmap <silent><buffer> <C-n> j
    nmap <silent><buffer> <C-p> k
    imap <silent><buffer> <C-l> <Esc>q
  endfunction

  " custom filters
  let s:filters = {
      \   "name" : "converter_filepath_filename",
      \   "description" : "filepath to filename"
  \}

  function! s:filters.filter(candidates, context)
      for candidate in a:candidates
        let items = split(candidate.word, ':')
        let items[0] = fnamemodify(items[0], ':t')
        let candidate.word = join(items, ':')
      endfor
      return a:candidates
  endfunction

  call unite#define_filter(s:filters)
  unlet s:filters

  call unite#custom#source('grep', 'converters', ["converter_filepath_filename"])
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

  return []
endfunction
