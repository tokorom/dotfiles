" --- indent settings ---
set shiftwidth=2
"ファイル内の <Tab> が対応する空白の数
set tabstop=2

" --- altr settings ---

call altr#remove_all()
" For ruby tdd
call altr#define('%.rb', 'spec/%_spec.rb')
" For rails
call altr#define('app/models/%.rb', 'spec/models/%_spec.rb', 'spec/factories/%s.rb')
call altr#define('app/controllers/%_controller.rb', 'app/views/%/index.html.erb', 'app/models/%.rb','spec/controllers/%_controller_spec.rb')
call altr#define('app/helpers/%.rb', 'spec/helpers/%_spec.rb')

" --- keymap ---
nnoremap <buffer><silent>   <Space>ct  <Esc>:call Ruby_execute_preview()<CR>

" --- functions ---
"ruby preview
function! Ruby_execute_preview() range
    execute ":!ruby %"
endfunction

