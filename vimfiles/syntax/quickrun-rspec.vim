if exists("b:current_syntax")
  finish
endif
   
if !exists("main_syntax")
  let main_syntax = 'quickrun-rspec'
endif

syntax case match

syntax match RSpecGreen /^\.*$/
syntax match RSpecRed   /^[F.]*F[F.]*$/
syntax match RSpecGreen /^.* 0 failure.*$/
syntax match RSpecRed   /^.* [1-9][0-9]* failure.*$/

highlight RSpecGreen ctermfg=White ctermbg=Green guifg=White guibg=Green
highlight RSpecRed   ctermfg=White ctermbg=Red   guifg=White guibg=Red

"unlet b:current_syntax
let b:current_syntax = 'quickrun-rspec'

if main_syntax == 'quickrun-rspec'
  unlet main_syntax
endif
