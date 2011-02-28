" ファイルタイプの追加

augroup AddFileType
  autocmd!

  " vim
  autocmd BufWinEnter,BufNewFile *.vimperatorrc set filetype=vim

  " mayu
  autocmd BufWinEnter,BufNewFile *.mayu,*.nodoka set filetype=mayu

  " ujml
  autocmd BufWinEnter,BufNewFile *.ujml,*.ujmi,*.ent,*.ujmc set filetype=ujml

  " ujml
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec

augroup END
