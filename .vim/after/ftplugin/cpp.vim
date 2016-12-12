" ÉRÉìÉpÉCÉãê›íË
setlocal makeprg=g++\ -o\ temp.a\ %
setlocal errorformat=%f:%l:\ %m

" --- altr settings ---

call altr#remove_all()
call altr#define('%.h', '%.hpp', '%.c', '%.cpp')

" --- keymap ---
nnoremap <buffer><silent>   <M-c><M-t>  <Esc>:call Cpp_execute_preview()<CR>
nnoremap <buffer><silent>   <Space>ct  <Esc>:call Cpp_execute_preview()<CR>

" --- functions ---
"c++ preview
function! Cpp_execute_preview() range
    let src = "temp.a"
    let dst = "c++ preview"
    " open the preview window
    silent execute ":pedit! " . dst
    " change to preview window
    wincmd P
    " set options
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal syntax=none
    setlocal bufhidden=delete
    " replace current buffer with output
    silent execute ":%! " . src . " 2>&1 "
    " change back to the source buffer
    wincmd p
endfunction

