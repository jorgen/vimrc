" Vim syntax file
" Language:     perforce (p4) forms
" Maintainer:   Warwick Allison <warwick@troll.no>
" Last change:  1999 Nov 09

" Remove any old syntax stuff hanging around
syn clear

syn keyword p4Todo contained    TODO FIXME XXX
syn match p4Todo "<[^>]*>"

" comments
syn match  p4Comment    "^#.*" contains=p4Todo
syn sync ccomment p4Comment

"labels
syn match p4Label   "^[A-Z][^:]*:"

syn case match

if !exists("wwa_did_p4_syntax_inits")
  let wwa_did_p4_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later

  hi link p4Comment             Comment
  hi link p4Label               Label
  hi link p4Todo                Todo
endif

let b:current_syntax = "p4"

" vim: ts=8
