"シフト移動幅
set shiftwidth=2
"ファイル内の <Tab> が対応する空白の数
set tabstop=2

" --- altr settings ---

call altr#remove_all()
call altr#define('%.h', '%.m', '%.mm')
call altr#define('en.lproj/%', 'ja.lproj/%')

" --- added keybinds ---

nnoremap [MyPrefix][   ebi[<Esc>ea<Space>]<Esc>i
nnoremap [MyPrefix]]   F[i[<Esc>f]a]<Esc>i<Space>
nnoremap [MyPrefix]@   ebi@"<Esc>ea"<Esc>
nnoremap [MyPrefix];   A;<Return>
