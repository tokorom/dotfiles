" textobj-objc - Text objects for Objective-C literals and blocks

" Interface "{{{1

" literals "{{{2

function! textobj#objc#select_literal_a() "{{{3
  let line = getline('.')
  let head_pos = getpos('.')
  let pos = head_pos[2]
  let atmark_idx = strridx(line, '@', pos)
  if atmark_idx < 0 || pos - 1 < atmark_idx
    return 0
  endif

  if pos - 1 != atmark_idx
    normal! F@
    let head_pos = getpos('.')
    let pos = head_pos[2]
  endif

  let next_char = line[pos]
  if "\"" == next_char
    normal! 2f"
  elseif "'" == next_char
    normal! 2f'
  elseif "(" == next_char
    normal! f)
  else
    normal! e
  endif
  let tail_pos = getpos('.')

  if tail_pos[2] <= head_pos[2]
    return 0
  endif

  return ['v', head_pos, tail_pos]
endfunction

function! textobj#objc#select_literal_i() "{{{3
  let line = getline('.')
  let head_pos = getpos('.')
  let pos = head_pos[2]
  let atmark_idx = strridx(line, '@', pos)
  if atmark_idx < 0 || pos - 1 < atmark_idx
    return 0
  endif

  if pos - 1 != atmark_idx
    normal! F@
    let pos = getpos('.')[2]
  endif

  let [b, l, c, v] = getpos('.')
  let next_char = line[pos]
  if "\"" == next_char
    let head_pos = [b, l, c + 2, v]
    normal! 2f"h
  elseif "'" == next_char
    let head_pos = [b, l, c + 2, v]
    normal! 2f'h
  elseif "(" == next_char
    let head_pos = [b, l, c + 2, v]
    normal! f)h
  else
    let head_pos = [b, l, c + 1, v]
    normal! e
  endif
  let tail_pos = getpos('.')

  if tail_pos[2] < head_pos[2]
    return 0
  endif

  return ['v', head_pos, tail_pos]
endfunction


" __END__
" __END__  "{{{1
" vim: foldmethod=marker
