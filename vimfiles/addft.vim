" ファイルタイプの追加

augroup AddFileType
  autocmd!

  " vim
  autocmd BufWinEnter,BufNewFile *.vimperatorrc set filetype=vim

  " mayu
  autocmd BufWinEnter,BufNewFile *.mayu,*.nodoka set filetype=mayu

  " ujml
  autocmd BufWinEnter,BufNewFile *.ujml,*.ujmi,*.ent,*.ujmc set filetype=ujml

  " rspec
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec

  " puthon.test
  autocmd BufWinEnter,BufNewFile test*.py set filetype=python.test

augroup END
