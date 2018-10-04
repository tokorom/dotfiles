" utils -----

"let s:default_location = '~/develop/vim_plugins/'
let s:plugins = []
let s:plugins_by_name = {}

function! s:add(name) abort
  let name = a:name

  let plugin = {}
  let plugin.name = name " plugin unique identifier
  let plugin.filetype = [] " supported filetypes
  " let plugin.will_load = function('foo')
  " let plugin.did_load = function('foo')
  
  call add(s:plugins, plugin)
  let s:plugins_by_name[name] = plugin
  return plugin
endfunction

function! s:load_plugin(plugin) abort
  let plugin = a:plugin
  if type(plugin) == type('')
    let plugin = get(s:plugins_by_name, plugin, {})
  endif

  if has_key(plugin, 'will_load')
    call plugin.will_load()
  endif

  execute 'packadd ' . plugin.name

  if has_key(plugin, 'did_load')
    call plugin.did_load()
  endif
endfunction

function! s:setup_plugins(...) abort
  let plugins = get(a:, 1, s:plugins)

  for plugin in plugins
    let filetypes = get(plugin, 'filetype', [])
    if type(filetypes) == type('')
      let filetypes = [filetypes]
    endif
    if empty(filetypes)
      call s:load_plugin(plugin)
    else
      for filetype in filetypes
        let command = 'call s:load_plugin("' . plugin.name . '")'
        execute 'autocmd FileType ' . filetype . ' ' . command
      endfor
    endif
  endfor
endfunction

" add plugins -----

" ale

let plugin = s:add('ale')
let plugin.filetype = ['vader', 'swift', 'review']
function! plugin.will_load() abort
  " 保存した時にチェック
  let g:ale_lint_on_save = 1
  " テキスト変更時にはチェックしない
  let g:ale_lint_on_text_changed = 0
  " ファイルオープン時にチェックしない
  let g:ale_lint_on_enter = 0
  " エラーがあればlistを自動で開く
  let g:ale_open_list = 1
  " QuickFixを使う
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1

  let g:ale_fixers = {
  \   'review': ['redpen', 'prhreview'],
  \}
endfunction

" completor.vim

let plugin = s:add('completor.vim')
function! plugin.will_load() abort
  let g:completor_auto_trigger = 1
  let g:completor_auto_complete_min_chars = 5
  let g:completor_min_chars = 1
  inoremap <expr> <C-n> pumvisible() ? "<C-n>" : "<C-r>=completor#do('complete')<CR>"
endfunction

" swift

call s:add('tokorom_swift_vim')

" swift-dict.vim

let plugin = s:add('swift-dict.vim')
let plugin.filetype = ['swift']
function! plugin.did_load() abort
  call swift_dict#configure_swift_dict_for_completor()
endfunction

" review

let plugin = s:add('vim-review')
function! plugin.will_load() abort
  let g:vim_review#include_filetypes = ['swift']
endfunction

" setup plugins
"
call s:setup_plugins()
