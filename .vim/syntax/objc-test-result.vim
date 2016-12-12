if exists("b:current_syntax")
  finish
endif
   
if !exists("main_syntax")
  let main_syntax = 'objc-test-result'
endif

syntax case match

syntax match ObjcTestGreen /^.*with 0 failures .*$/
syntax match ObjcTestRed   /^.*with [1-9][0-9]* failures .*$/
syntax match ObjcTestGreen /\*\* BUILD SUCCEEDED \*\*/
syntax match ObjcTestRed   /\*\* BUILD FAILED \*\*/

highlight ObjcTestGreen ctermfg=White ctermbg=Green guifg=White guibg=Green
highlight ObjcTestRed   ctermfg=White ctermbg=Red   guifg=White guibg=Red

syntax region ObjcTestBuildResults start=/^GHUNIT_CLI/ end=/Running:.*$/ transparent fold
syntax region ObjcTestFailBlock start="#0" end="FAIL (" transparent fold

"unlet b:current_syntax
let b:current_syntax = 'objc-test-result'

if main_syntax == 'objc-test-result'
  unlet main_syntax
endif
