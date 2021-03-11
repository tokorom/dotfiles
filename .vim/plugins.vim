scriptencoding utf-8

" ==============================
" thinpl settings -----

let g:thinpl#git_clone_location = '~/develop/vim_plugins'

" ==============================
" plugins -----

let plugin = thinpl#add('w0ng/vim-hybrid')
" settings {{{1
function! plugin.did_load() abort
  colorscheme hybrid
endfunction
" 1}}}

let plugin = thinpl#add('vim-scripts/autodate.vim')

let plugin = thinpl#add('vim-scripts/surround.vim')

let plugin = thinpl#add('kana/vim-fakeclip')

let plugin = thinpl#add('vim-scripts/L9')

let plugin = thinpl#add('kana/vim-altr')

let plugin = thinpl#add('kana/vim-textobj-user')
let plugin = thinpl#add('kana/vim-textobj-indent')
let plugin = thinpl#add('kana/vim-textobj-function')
let plugin = thinpl#add('kana/vim-textobj-line')
" settings {{{1
function! plugin.will_load() abort
  omap l <Plug>(textobj-line-a)
endfunction
" 1}}}

let plugin = thinpl#add('kana/vim-operator-user')
let plugin = thinpl#add('emonkak/vim-operator-comment')
" settings {{{1
function! plugin.will_load() abort
  nmap [MyPrefix]x <Plug>(operator-comment)
  nmap [MyPrefix]z <Plug>(operator-uncomment)
  vmap [MyPrefix]x <Plug>(operator-comment)
  vmap [MyPrefix]z <Plug>(operator-uncomment)
  nmap [MyPrefix]xx <Plug>(operator-comment)l
  nmap [MyPrefix]zz <Plug>(operator-uncomment)l
endfunction
" 1}}}
let plugin = thinpl#add('kana/vim-operator-replace')
" settings {{{1
function! plugin.will_load() abort
  nmap [MyPrefix]r <Plug>(operator-replace)
  vmap [MyPrefix]r <Plug>(operator-replace)
  nmap [MyPrefix]rr <Plug>(operator-replace)iw
endfunction
" 1}}}

" Auto close parentheses
let plugin = thinpl#add('cohama/lexima.vim')

let plugin = thinpl#add('junegunn/vader.vim')

let plugin = thinpl#add('prabirshrestha/async.vim')
let plugin.filetype = ['swift']

let plugin = thinpl#add('prabirshrestha/vim-lsp')
let plugin.filetype = ['swift']
" settings {{{1
function! plugin.prepare() abort
  let g:lsp_auto_enable = 0
  let g:lsp_diagnostics_enabled = 0
  au FileType swift setlocal omnifunc=lsp#complete
  if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'sourcekit-lsp',
      \ 'cmd': {server_info->['sourcekit-lsp']},
      \ 'whitelist': ['swift'],
      \ })
  endif
endfunction
function! plugin.did_load() abort
  call lsp#enable()
  nnoremap <C-]> :<C-u>LspDefinition<CR>
  nnoremap [MyPrefix].o :<C-u>LspHover<CR>
endfunction
" 1}}}

let plugin = thinpl#add('SirVer/ultisnips')
" settings {{{1
function! plugin.will_load() abort
  let g:UltiSnipsSnippetDirectories=['snippets/usnippets', 'UltiSnips']
  let g:UltiSnipsExpandTrigger='<tab>'
  let g:UltiSnipsJumpForwardTrigger='<tab>'
  let g:UltiSnipsJumpBackwardTrigger='<c-b>'
endfunction
" 1}}}

let plugin = thinpl#add('thinca/vim-quickrun')
" settings {{{1
function! plugin.will_load() abort
  map [MyPrefix]q <Nop>
  map [MyPrefix]q <Plug>(quickrun)
endfunction
function! plugin.did_load() abort
  if !exists('g:quickrun_config')
    let g:quickrun_config = {}
  endif

  let g:quickrun_config['*'] = {'split': 'below'}

  let g:quickrun_config['markdown'] = {
    \ 'outputter' : 'null',
    \ 'command' : 'open',
    \ 'cmdopt' : '-a',
    \ 'args' : 'Marked\ 2',
    \ 'exec' : '%c %o %a %s',
    \ }
endfunction
" 1}}}

let plugin = thinpl#add('itchyny/lightline.vim')
" settings {{{1
function! plugin.will_load() abort
  let g:lightline = {'colorscheme': 'wombat'}
endfunction
" 1}}}

" let plugin = thinpl#add('junegunn/fzf')
" let plugin = thinpl#add('junegunn/fzf.vim')
" " settings {{{1
" function! plugin.will_load() abort
"   let g:fzf_command_prefix = 'Fzf'
"   let g:fzf_layout = { 'up': '~40%' }
" 
"   nnoremap [MyPrefix].f :<C-u>FzfFiles<CR>
"   nnoremap [MyPrefix].b :<C-u>FzfBuffers<CR>
"   nnoremap [MyPrefix].r :<C-u>FzfHistory<CR>
"   nnoremap [MyPrefix].l :<C-u>FzfLines<CR>
"   nnoremap [MyPrefix].h :<C-u>FzfHelptags<CR>
"   nnoremap [MyPrefix].s :<C-u>FzfFiles $VIMHOME/snippets/<CR>
"   nnoremap [MyPrefix].p :<C-u>tabnew $VIMHOME/plugins.vim<CR>:<C-u>FzfLines<CR>
"   nnoremap <expr> [MyPrefix].g ':FzfAg ' . expand('<cword>')
" endfunction
" " 1}}}

" Fuzzy Finder {{{1

function! Fzy(select_command, choice_command, file, word)
  function! ExitCb(job, status)
    if a:status != 0
      let g:fzy#last_selected = ''
      return
    endif
    let selected = term_getline(g:fzy#last_buf, 1)
    :q
    if !empty(selected)
      let m_filename_and_line = matchlist(selected, '^\([^:]\+\):\(\d\+\):') 
      if len(m_filename_and_line) < 3
        let file = g:fzy#last_file
        let m_line = matchlist(selected, '^\(\d\+\):') 
        if len(m_line) > 1 && !empty(file)
          let line = m_line[1]
          exec g:fzy#last_select_command . ' ' . file
          exec ':' . line
        else
          exec g:fzy#last_select_command . ' ' . selected
        endif
      else
        let filename = m_filename_and_line[1]
        let line = m_filename_and_line[2]
        exec g:fzy#last_select_command . ' ' . filename
        exec ':' . line
      endif
    endif
  endfunction

  let choice_command = a:choice_command
  if !empty(a:file)
    let choice_command = substitute(choice_command, '${file}', a:file, 'g') 
  endif
  if !empty(a:word)
    let choice_command = substitute(choice_command, '${word}', a:word, 'g') 
  endif
  let command = $SHELL . ' -c "' . choice_command . '"'
  let options = {
  \   "term_finish": "close",
  \   "exit_cb": "ExitCb",
  \ }
  let g:fzy#last_select_command = a:select_command
  let g:fzy#last_file = a:file
  let g:fzy#last_buf = term_start(command, options)
endfunction

function! FzyOldFiles(select_command)
endfunction

command! -nargs=1 FzyGrep call Fzy(":TabNewOrSelect", "rg -n --no-heading ${word} | fzf", "", <f-args>)

nnoremap <silent> [MyPrefix].f :call Fzy(":TabNewOrSelect", "fd --type f \| fzf", "", "")<CR>
nnoremap <silent> [MyPrefix].l :call Fzy(":TabNewOrSelect", "rg -n '' ${file} \| fzf --reverse", expand("%"), "")<CR>
nnoremap <silent> [MyPrefix].p :call Fzy(":TabNewOrSelect", "rg -n '' ${file} \| fzf --reverse", "$VIMHOME/plugins.vim", "")<CR>
nnoremap <silent> [MyPrefix].s :call Fzy(":TabNewOrSelect", "fd --type f '' $VIMHOME/snippets/ \| fzf", "", "")<CR>
nnoremap <silent> [MyPrefix].r :call FzyOldFiles(":TabNewOrSelect")<CR>
nnoremap <expr> [MyPrefix].g ':FzyGrep ' . expand('<cword>')

" 1}}}

let plugin = thinpl#add('tokorom/tabnew-or-select.vim')
" settings {{{1
function! plugin.will_load() abort
  let g:fzf_action = {
    \ '':       'TabNewOrSelect',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
endfunction
" 1}}}

let plugin = thinpl#add('tokorom/ale')
let plugin.filetype = ['vader', 'swift', 'review', 'javascript', 'vue']
" settings {{{1
function! plugin.will_load() abort
  " 保存した時にチェック
  let g:ale_lint_on_save = 1
  " テキスト変更時にはチェックしない
  let g:ale_lint_on_text_changed = 'never'
  " ファイルオープン時にチェックしない
  let g:ale_lint_on_enter = 0
  " エラーがあればlistを自動で開く
  let g:ale_open_list = 1
  " QuickFixを使う
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1

  " Only run linters named in ale_linters settings.
  let g:ale_linters_explicit = 1

  let g:ale_linters = {
  \   'vim': ['vint'],
  \   'swift': ['swift-format'],
  \   'javascript': ['eslint'],
  \   'vue': ['eslint'],
  \   'review': ['redpen', 'prhreview'],
  \}
endfunction
" 1}}}

let plugin = thinpl#add('tokorom/vim-swift-format')
let plugin.filetype = ['swift']
" settings {{{1
function! plugin.prepare() abort
  let g:vim_swift_format_use_ale = 1
endfunction
" 1}}}

" sort_by_priority_preprocessor {{{1
function! s:sort_by_priority_preprocessor(options, matches) abort
  let l:items = []
  let l:startcols = []
  for [l:source_name, l:matches] in items(a:matches)
    let l:startcol = l:matches['startcol']
    let l:base = a:options['typed'][l:startcol - 1:]
    for l:item in l:matches['items']
      if stridx(l:item['word'], l:base) == 0
        let l:startcols += [l:startcol]
        let l:item['priority'] =
                    \ get(asyncomplete#get_source_info(l:source_name), 'priority', 0)
        call add(l:items, l:item)
      endif
    endfor
  endfor

  let a:options['startcol'] = min(l:startcols)
  let l:items = sort(l:items, {a, b -> b['priority'] - a['priority']})

  call asyncomplete#preprocess_complete(a:options, l:items)
endfunction
" 1}}}

let plugin = thinpl#add('prabirshrestha/asyncomplete.vim')
" settings {{{1
function! plugin.will_load() abort
  let g:asyncomplete_auto_popup = 0
  let g:asyncomplete_auto_completeopt = 1
  let g:asyncomplete_preprocessor = [function('s:sort_by_priority_preprocessor')]
  inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"
  imap <expr> <C-h> pumvisible() ? "\<C-h>" . asyncomplete#force_refresh() : "\<C-h>"
  imap <C-n> <Plug>(asyncomplete_force_refresh)
endfunction
" 1}}}

let plugin = thinpl#add('prabirshrestha/asyncomplete-ultisnips.vim')
" settings {{{1
function! plugin.did_load() abort
  call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
    \ 'name': 'ultisnips',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
    \ 'priority': 1000,
    \ }))
endfunction
" 1}}}

let plugin = thinpl#add('tokorom/asyncomplete-dictionary.vim')
" settings {{{1
function! plugin.did_load() abort
  call asyncomplete#register_source({
    \ 'name': 'dictionary',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#dictionary#completor'),
    \ })
endfunction
" 1}}}

let plugin = thinpl#add('tokorom/asyncomplete-shellcommand.vim')
let plugin.filetype = ['swift']
" settings {{{1
function! plugin.did_load() abort
  let g:asyncomplete#sources#shellcommand#command = 'ag ${token} | grep -o "[[:alnum:]]\+" | fzy -e ${token} | uniq'
  call asyncomplete#register_source({
    \ 'name': 'project',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#shellcommand#completor'),
    \ 'priority': 100,
    \ })
endfunction
" 1}}}

let plugin = thinpl#add('swift_vim')
let plugin.repository = ''
let plugin.local_location = '~/develop/github/swift/utils/vim'
" settings {{{1
function! plugin.prepare() abort
  augroup overrideSwiftVim
    autocmd!
    autocmd FileType swift setlocal shiftwidth=4
    autocmd FileType swift setlocal tabstop=4
  augroup END
endfunction
" 1}}}

let plugin = thinpl#add('tokorom/swift-dict.vim')
let plugin.filetype = ['swift']
" settings {{{1
function! plugin.did_load() abort
  call swift_dict#configure_swift_dict_for_completor()
endfunction
" 1}}}

let plugin = thinpl#add('tokorom/swift-smart-move.vim')
let plugin.filetype = ['swift']

let plugin = thinpl#add('tokorom/vim-review')
" settings {{{1
function! plugin.will_load() abort
  let g:vim_review#include_filetypes = ['swift']
endfunction
" 1}}}

let plugin = thinpl#add('rakr/vim-one')
let plugin.filetype = ['review']
" settings {{{1
function! plugin.did_load() abort
  set background=light
  let g:one_allow_italics = 1
  colorscheme one

  highlight Normal ctermfg=Black
endfunction
" 1}}}

let plugin = thinpl#add('tokorom/ale-prh-review')
let plugin.filetype = ['review', 'vader']

let plugin = thinpl#add('tpope/vim-fugitive')
let plugin = thinpl#add('tpope/vim-rhubarb')

let plugin = thinpl#add('sjl/gundo.vim')
let plugin.command = ['Gundo*']
" settings {{{1
function! plugin.prepare() abort
  execute 'command! GundoEnable call thinpl#load_plugin("' . self.name . '", "gundo plugin is loaded :)")'
endfunction
" 1}}}

let plugin = thinpl#add('airblade/vim-gitgutter')
let plugin.autocmd = ['BufWrite']
" settings {{{1
function! plugin.did_load() abort
  call gitgutter#all(1)
endfunction
" 1}}}

let plugin = thinpl#add('cespare/vim-toml')

let plugin = thinpl#add('chrismetcalf/vim-markdown')

let plugin = thinpl#add('elzr/vim-json')

let plugin = thinpl#add('tokorom/urldecoder.vim')

let plugin = thinpl#add('rizzatti/dash.vim')
" settings {{{1
function! plugin.did_load() abort
  nnoremap <expr> [MyPrefix]h ':Dash ' . expand('<cword>')
endfunction
" 1}}}

let plugin = thinpl#add('posva/vim-vue')

let plugin = thinpl#add('tokorom/vim-replace-current-line')
let plugin.filetype = ['markdown']
function! plugin.did_load() abort
  command! -nargs=0 MarkdownImageFromLine :call vim_replace_current_line#execute("./.vim-replace-current-line/markdown-image-from-line")
  command! -nargs=0 MarkdownImageWithScreenshot :call vim_replace_current_line#execute("./.vim-replace-current-line/markdown-image-with-screenshot")
  command! -nargs=0 GitHubWikiImageFromLine :call vim_replace_current_line#execute("~/.vim-replace-current-line/github-image-from-line")
  command! -nargs=0 GitHubWikiImageWithScreenshot :call vim_replace_current_line#execute("~/.vim-replace-current-line/github-image-with-screenshot")
endfunction

" ==============================
" setup added plugins
call thinpl#setup_plugins()
