" Vim color file
" Maintainer:   Rainer M. Schmid <rms@trolltech.com>
" Last Change:  $Id: rms_midnight.vim,v 1.1 2003/10/26 18:34:54 anders Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="rms_midnight"

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Normal	guifg=lightsteelblue	guibg=#00006f
hi StatusLine				guibg=red

hi Folded	guifg=yellow		guibg=#000047
hi FoldColumn	guifg=darkblue		guibg=steelblue3

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Console settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
hi StatusLine			ctermbg=red

hi Folded	ctermfg=11	ctermbg=4
hi FoldColumn	ctermfg=11	ctermbg=14



"""""""""""""""""""""""""""""""""""""""""""""""""""""
"hi Cursor		
"hi CursorIM	
"hi Directory	
"hi DiffAdd		
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
"hi VertSplit	
"hi IncSearch	
"hi LineNr		
"hi ModeMsg		
"hi MoreMsg		
"hi NonText		
"hi Question	
"hi Search		
"hi SpecialKey	
"hi Title		
"hi Visual		
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
"hi Comment
"hi Constant	
"hi Identifier	
"hi Statement	
"hi PreProc	
"hi Type		
"hi Special	
"hi Underlined	
"hi Ignore		
"hi Error		
"hi Todo		

