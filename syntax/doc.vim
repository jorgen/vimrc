" Vim syntax file
" Language:	Vim
" Maintainer:	Mark Summerfield <summer@ourobourus.com>
" Last Change:	$Id: doc.vim,v 1.3 2002/07/11 08:52:57 rms Exp $
"
" Copyright (c) 2001 Mark Summerfield. All Rights Reserved.

" remove old syntax
syn clear

syn match docClass	"\\class\s\+\k\+"
syn region docClass	start='\\class\s*{' end='}'
syn match docItalic	"\\e\s\+\k\+"
syn region docItalic	start='\\e\s*{' end='}'

syn match docUserTag	"\\[A-Z]\k*"
syn region docUserTag	start='\\[A-Z]\k*{' end='}'

syn match docInlineTag	"\\link"
syn match docInlineTag	"\\endlink"

syn match docInlineTag	"\\a\s\+\k\+"
syn match docInlineTag	"\\c\s\+\k\+"
syn match docInlineTag	"\\fn\s\+\k\+"

syn region docInlineTag	start="\\a\s*$" end='\s'
syn region docInlineTag	start="\\c\s*$" end='\s'
syn region docInlineTag	start="\\l\s*$" end='\s'
syn region docInlineTag	start="\\fn\s*$" end='\s'

syn region docInlineTag	start="\\a{" end='}'
syn region docInlineTag	start="\\c{" end='}'
syn region docInlineTag	start="\\l{" end='}'
syn region docInlineTag	start="\\fn{" end='}'

syn match docTag	"\\annotatedclasslist$"
syn match docTag	"\\arg$"
syn match docTag	"\\base$"
syn match docTag	"\\box$"
syn match docTag	"\\endbox$"
syn match docTag	"\\brief$"
syn match docTag	"\\bug$"
syn match docTag	"\\c$"
syn match docTag	"\\caption$"
syn match docTag	"\\chapter$"
syn match docTag	"\\class$"
syn match docTag	"\\classhierarchy$"
syn match docTag	"\\classlist$"
syn match docTag	"\\code$"
syn match docTag	"\\endcode$"
syn match docTag	"\\endomit$"
syn match docTag	"\\defgroup$"
syn match docTag	"\\define$"
syn match docTag	"\\enum$"
syn match docTag	"\\extension$"
syn match docTag	"\\extensionlist$"
syn match docTag	"\\fn$"
syn match docTag	"\\footnote$"
syn match docTag	"\\endfootnote$"
syn match docTag	"\\functionindex$"
syn match docTag	"\\granularity$"
syn match docTag	"\\header$"
syn match docTag	"\\headerfilelist$"
syn match docTag	"\\heading$"
syn match docTag	"\\i$"
syn match docTag	"\\img$"
syn match docTag	"\\important$"
syn match docTag	"\\include$"
syn match docTag	"\\index$"
syn match docTag	"\\ingroup$"
syn match docTag	"\\input$"
syn match docTag	"\\internal$"
syn match docTag	"\\keyword$"
syn match docTag	"\\l$"
syn match docTag	"\\list$"
syn match docTag	"\\endlist$"
syn match docTag	"\\module$"
syn match docTag	"\\mustquote$"
syn match docTag	"\\note$"
syn match docTag	"\\obsolete$"
syn match docTag	"\\omit$"
syn match docTag	"\\overload$"
syn match docTag	"\\page$"
syn match docTag	"\\plainpage$"
syn match docTag	"\\printline$"
syn match docTag	"\\printto$"
syn match docTag	"\\printuntil$"
syn match docTag	"\\property$"
syn match docTag	"\\quotelist$"
syn match docTag	"\\quotefile$"
syn match docTag	"\\r$"
syn match docTag	"\\row$"
syn match docTag	"\\reimp$"
syn match docTag	"\\relates$"
syn match docTag	"\\sa$"
syn match docTag	"\\section\d$"
syn match docTag	"\\sidebar$"
syn match docTag	"\\endsidebar$"
syn match docTag	"\\skipline$"
syn match docTag	"\\skipto$"
syn match docTag	"\\skipuntil$"
syn match docTag	"\\table$"
syn match docTag	"\\target$"
syn match docTag	"\\endtable$"
syn match docTag	"\\threadsafe$"
syn match docTag	"\\title$"
syn match docTag	"\\value$"
syn match docTag	"\\version$"
syn match docTag	"\\walkthrough$"
syn match docTag	"\\warning$"

syn match docTag	"\\annotatedclasslist\s\+"
syn match docTag	"\\arg\s\+"
syn match docTag	"\\base\s\+"
syn match docTag	"\\box\s\+"
syn match docTag	"\\endbox\s\+"
syn match docTag	"\\brief\s\+"
syn match docTag	"\\bug\s\+"
syn match docTag	"\\c\s\+"
syn match docTag	"\\caption\s\+"
syn match docTag	"\\chapter\s\+"
syn match docTag	"\\class\s\+"
syn match docTag	"\\classhierarchy\s\+"
syn match docTag	"\\classlist\s\+"
syn match docTag	"\\code\s\+"
syn match docTag	"\\endcode\s\+"
syn match docTag	"\\endomit\s\+"
syn match docTag	"\\defgroup\s\+"
syn match docTag	"\\define\s\+"
syn match docTag	"\\enum\s\+"
syn match docTag	"\\extension\s\+"
syn match docTag	"\\extensionlist\s\+"
syn match docTag	"\\fn\s\+"
syn match docTag	"\\footnote\s\+"
syn match docTag	"\\endfootnote\s\+"
syn match docTag	"\\functionindex\s\+"
syn match docTag	"\\granularity\s\+"
syn match docTag	"\\header\s\+"
syn match docTag	"\\headerfilelist\s\+"
syn match docTag	"\\heading\s\+"
syn match docTag	"\\i\s\+"
syn match docTag	"\\img\s\+"
syn match docTag	"\\important\s\+"
syn match docTag	"\\include\s\+"
syn match docTag	"\\index\s\+"
syn match docTag	"\\ingroup\s\+"
syn match docTag	"\\input\s\+"
syn match docTag	"\\internal\s\+"
syn match docTag	"\\keyword\s\+"
syn match docTag	"\\l\s\+"
syn match docTag	"\\list\s\+"
syn match docTag	"\\endlist\s\+"
syn match docTag	"\\module\s\+"
syn match docTag	"\\mustquote\s\+"
syn match docTag	"\\note\s\+"
syn match docTag	"\\obsolete\s\+"
syn match docTag	"\\omit\s\+"
syn match docTag	"\\overload\s\+"
syn match docTag	"\\page\s\+"
syn match docTag	"\\plainpage\s\+"
syn match docTag	"\\printline\s\+"
syn match docTag	"\\printto\s\+"
syn match docTag	"\\printuntil\s\+"
syn match docTag	"\\property\s\+"
syn match docTag	"\\quotelist\s\+"
syn match docTag	"\\quotefile\s\+"
syn match docTag	"\\r\s\+"
syn match docTag	"\\row\s\+"
syn match docTag	"\\reimp\s\+"
syn match docTag	"\\relates\s\+"
syn match docTag	"\\sa\s\+"
syn match docTag	"\\section\d\s\+"
syn match docTag	"\\sidebar\s\+"
syn match docTag	"\\endsidebar\s\+"
syn match docTag	"\\skipline\s\+"
syn match docTag	"\\skipto\s\+"
syn match docTag	"\\skipuntil\s\+"
syn match docTag	"\\table\s\+"
syn match docTag	"\\target\s\+"
syn match docTag	"\\endtable\s\+"
syn match docTag	"\\title\s\+"
syn match docTag	"\\value\s\+"
syn match docTag	"\\version\s\+"
syn match docTag	"\\walkthrough\s\+"
syn match docTag	"\\warning\s\+"


syn match funcTag	"\w\+()"
syn match classTag	"Q\w\+\(::\w\+\(()\)\?\)\?"
syn match   docComment	"^#.*$" contains=docTodo
syn keyword docTodo		contained TODO FIXME XXX

syn sync maxlines=3

if !exists("did_doc_syntax_inits")
  let did_doc_syntax_inits = 1
  set nosi ai
  " The default methods for highlighting.  Can be overridden later
  hi link docTag		Statement
  hi link docInlineTag		Define
  hi link docUserTag		Constant
  hi link docComment		Comment
  hi link docTodo		Todo
  hi link funcTag		Label
  hi link classTag		Label
  hi docClass term=bold cterm=bold gui=bold
  hi docItalic term=italic cterm=italic gui=italic
  hi docUnderline term=underline cterm=underline gui=underline
endif

let b:current_syntax = "doc"

" vim: ts=8
