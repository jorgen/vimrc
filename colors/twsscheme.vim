" Vim color file
" Maintainer:   Trenton Schulz <twschulz@yahoo.com>
" Last Change:  
" URL:		

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

" your pick:
set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="mycolorscheme"

hi Normal guibg=#F8F8D8 guifg=Black

" OR

" highlight clear Normal
" set background&
" highlight clear
" if &background == "light"
"   highlight Error ...
"   ...
" else
"   highlight Error ...
"   ...
" endif

" A good way to see what your colorscheme does is to follow this procedure:
" :w 
" :so % 
"
" Then to see what the current setting is use the highlight command.  
" For example,
" 	:hi Cursor
" gives
"	Cursor         xxx guifg=bg guibg=fg 
 	
" Uncomment and complete the commands you want to change from the default.

"hi Cursor		
"hi CursorIM	
"hi Directory	
"hi DiffAdd		
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
"hi VertSplit	
"hi Folded		
"hi FoldColumn	
"hi IncSearch	
"hi LineNr		
"hi ModeMsg		
"hi MoreMsg		
"hi NonText		
"hi Question	
"hi Search		
"hi SpecialKey	
"hi StatusLine	
"hi StatusLineNC	
"hi Title		
"hi Visual		
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
hi Comment gui=italic guifg=#00008b ctermfg=blue cterm=underline
hi Constant guifg=#008b00 ctermfg=darkgreen
hi Identifier guifg=blue ctermfg=blue
hi Statement gui=bold guifg=black ctermfg=black cterm=bold
hi PreProc gui=bold guifg=darkblue ctermfg=darkblue cterm=bold
hi Type	gui=bold guifg=black ctermfg=black cterm=bold
hi Special guifg=red ctermfg=red
hi Underlined	guifg=gray guifg=yellow	
hi Search guibg=orange
"hi Ignore		
"hi Error		
"hi Todo		

