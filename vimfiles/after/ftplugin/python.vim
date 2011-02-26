setl autoindent
setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
setl tabstop=8 expandtab shiftwidth=2 softtabstop=2

" create a test class ( testXXX.py )
function! TestClass() 
  let l:bname = bufname('%')
  let l:newname = substitute(l:bname, '[^/\\]*\.py', 'test\0', '')
  let l:bpath = substitute(l:bname, '\.py', '', '')
  let l:bpath = substitute(l:bpath, '\/', '.', 'g')
  let l:cname = substitute(l:bname, '\.py', '', '')
  let l:cname = substitute(l:cname, '^.*[/\\]', '', '')
  let l:cname = substitute(l:cname, '^.', '\u\0', '')
  execute ":tabnew " . l:newname
  let l:result = append(  0, 'import unittest' )
  let l:result = append(  1, 'from ' . l:bpath . ' import ' . l:cname )
  let l:result = append(  2, '' )
  let l:result = append(  3, 'class Test'. l:cname . '(unittest.TestCase):' )
  let l:result = append(  4, '' )
  let l:result = append(  5, '  def setUp(self):' )
  let l:result = append(  6, '    self.c = ' . l:cname . '()' )
  let l:result = append(  7, '    pass' )
  let l:result = append(  8, '' )
  let l:result = append(  9, '  def tearDown(self):' )
  let l:result = append( 10, '    pass' )
  let l:result = append( 11, '' )
  let l:result = append( 12, '  def test_instance(self):' )
  let l:result = append( 13, '    self.assertNotEquals( None, self.c )' )
endfunction
command! TestClass :call TestClass()

