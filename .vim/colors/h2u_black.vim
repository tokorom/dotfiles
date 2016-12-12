" h2u_black
"
" Based on ir_black color scheme
" See also: http://blog.infinitered.com/entries/show/8

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "h2u_black"


" General
hi Normal          guifg=#ffffff  guibg=#222222  gui=NONE

hi Cursor          guifg=#000000  guibg=#ffffff  gui=NONE
hi CursorIM        guifg=#ffffff  guibg=#ff6666  gui=NONE

hi CursorColumn    guifg=NONE     guibg=#444444  gui=NONE
hi CursorLine      guifg=NONE     guibg=#444444  gui=NONE
hi MatchParen      guifg=NONE     guibg=#66ff66  gui=NONE

hi NonText         guifg=#444444  guibg=#111111  gui=NONE
hi SpecialKey      guifg=#999999  guibg=#333333  gui=NONE

hi Visual          guifg=NONE     guibg=#334466  gui=NONE
" hi VisualNOS

hi LineNr          guifg=#666666  guibg=#000000  gui=NONE

hi StatusLine      guifg=#cccccc  guibg=#333333  gui=NONE
hi StatusLineNC    guifg=#666666  guibg=#333333  gui=NONE

hi VertSplit       guifg=#666666  guibg=#333333  gui=NONE

hi Folded          guifg=NONE     guibg=#223355  gui=NONE
hi FoldColumn      guifg=NONE     guibg=#223355  gui=NONE

hi Pmenu           guifg=#ffffff  guibg=#444444  gui=NONE
hi PmenuSel        guifg=#000000  guibg=#ccee88  gui=NONE
hi PmenuSbar       guifg=#000000  guibg=#ffffff  gui=NONE
hi PmenuThumb      guifg=#ffffff  guibg=#bbbbbb  gui=NONE

" hi SignColumn

hi ModeMsg         guifg=#000000  guibg=#ccee88  gui=bold
hi MoreMsg         guifg=#000000  guibg=#88ccee  gui=bold
hi WarningMsg      guifg=#ffffff  guibg=#ff6666  gui=bold
hi ErrorMsg        guifg=#ffffff  guibg=#ff6666  gui=bold
hi WildMenu        guifg=#000000  guibg=#ccee88  gui=NONE
" hi Question

hi Search          guifg=NONE     guibg=#444444  gui=NONE
hi IncSearch       guifg=NONE     guibg=#444444  gui=NONE

hi Title           guifg=#ffffee  guibg=NONE     gui=bold

" hi Directory

" hi DiffAdd
" hi DiffChange
" hi DiffDelete
" hi DiffText

" hi SpellBad
" hi SpellCap
" hi SpellLocal
" hi SpellRare

" hi TabLine
" hi TabLineFill
" hi TabLineSel


" Syntax
hi Comment         guifg=#777777  guibg=NONE     gui=NONE

hi Constant        guifg=#99CC99  guibg=NONE     gui=NONE
hi String          guifg=#aaff66  guibg=NONE     gui=NONE
hi Character       guifg=#99CC99  guibg=NONE     gui=NONE
hi Number          guifg=#ff77ff  guibg=NONE     gui=NONE
hi Boolean         guifg=#99CC99  guibg=NONE     gui=NONE
hi Float           guifg=#ff77ff  guibg=NONE     gui=NONE

hi Identifier      guifg=#ccccff  guibg=NONE     gui=NONE
hi Function        guifg=#ffddaa  guibg=NONE     gui=NONE

hi Statement       guifg=#6699cc  guibg=NONE     gui=NONE
hi Conditional     guifg=#6699cc  guibg=NONE     gui=NONE
hi Repeat          guifg=#6699cc  guibg=NONE     gui=NONE
hi Label           guifg=#6699cc  guibg=NONE     gui=NONE
hi Operator        guifg=#ffeedd  guibg=NONE     gui=NONE
hi Keyword         guifg=#99ccff  guibg=NONE     gui=NONE
hi Exception       guifg=#6699cc  guibg=NONE     gui=NONE

hi PreProc         guifg=#99ccff  guibg=NONE     gui=NONE
hi Include         guifg=#99ccff  guibg=NONE     gui=NONE
hi Define          guifg=#99ccff  guibg=NONE     gui=NONE
hi Macro           guifg=#99ccff  guibg=NONE     gui=NONE
hi PreCondit       guifg=#99ccff  guibg=NONE     gui=NONE

hi Type            guifg=#ffffbb  guibg=NONE     gui=NONE
hi StorageClass    guifg=#ffffbb  guibg=NONE     gui=NONE
hi Structure       guifg=#ffffbb  guibg=NONE     gui=NONE
hi Typedef         guifg=#ffffbb  guibg=NONE     gui=NONE

hi Special         guifg=#dd8866  guibg=NONE     gui=NONE
hi SpecialChar     guifg=#dd8866  guibg=NONE     gui=NONE
hi Tag             guifg=#dd8866  guibg=NONE     gui=NONE
hi Delimiter       guifg=#00bbbb  guibg=NONE     gui=NONE
hi SpecialComment  guifg=#dd8866  guibg=NONE     gui=NONE
hi Debug           guifg=#dd8866  guibg=NONE     gui=NONE

hi Underlined      guifg=NONE     guibg=NONE     gui=underline

hi Ignore          guifg=#cccccc  guibg=#222222  gui=NONE

hi Error           guifg=NONE     guibg=NONE     gui=undercurl  guisp=#ff6666

hi Todo            guifg=#888888  guibg=NONE     gui=NONE
