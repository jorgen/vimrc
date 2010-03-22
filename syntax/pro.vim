" Vim syntax file
" Language:	qmake project files (*.pro)
" Maintainer:	Rainer M. Schmid <rms@trolltech.com>
" Version:	$Id: pro.vim,v 1.2 2002/04/03 08:44:14 rms Exp $

" init {{{

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif


if version >= 600
    " save cpo (we use line-continuation)
    let s:save_cpo = &cpo
    set cpo&vim
endif

" }}}

syn case match

" variables with values and scope {{{

syn region	proScopeContent	matchgroup=proScope
		\ start=/^\s*!\=[-+[:alnum:]_.]\+\s*{/
		\ end=/}/
		\ nextgroup=proScope,proScopeContent
		\ transparent
syn region	proScopeContent	matchgroup=proScope
		\ start=/\s*!\=[-+[:alnum:]_.]\+\s*{/
		\ end=/}/
		\ nextgroup=proScope,proScopeContent
		\ transparent
		\ contained

syn match	proScope
		\ /^\s*!\=[-+[:alnum:]_.]\+[:|]/
		\ nextgroup=proVariable,proScope,proScopeContent
syn match	proScope
		\ /!\=[-+[:alnum:]_.]\+[:|]/
		\ nextgroup=proVariable,proScopeContent,proScope
		\ contained

syn match	proVariable
		\ /^\s*[-[:alnum:]_.]\+\s*[+-\*~]\{0,1}=/
		\ nextgroup=proVarValue
syn match	proVariable
		\ /[-[:alnum:]_.]\+\s*[+-\*~]\{0,1}=/
		\ nextgroup=proVarValue
		\ contained

syn region	proVarValue
		\ start=/./
		\ end=/$/
		\ contains=proContinue,proComment,proExpFuncArg
		\ contained
		\ oneline

syn region	proExpFuncArg matchgroup=proExpFunc
		\ start=/\$\$[a-zA-Z][a-zA-Z0-9_]*(/
		\ end=/)/
		\ contains=proExpFuncArg
		\ skip=/(.\{-})/
		\ contained
		\ oneline

" These are the 'builtin' functions. They are disabled because I can't figure out how to
" have user functions (above) appear different (the pattern's aren't mutually exlusive)
"syn region	proExpFuncArg matchgroup=proExpFunc
"		\ start=/\$\$\(member\|first\|last\|cat\|fromfile\|eval\|list\|sprintf\|join\|split\|basename\|dirname\|section\|find\|system\|unique\|quote\|upper\|lower\|re_escape\|files\|prompt\)(/
"		\ end=/)/
"		\ contains=proExpFuncArg
"		\ skip=/(.\{-})/
"		\ contained
"		\ oneline

syn match	proContinue
		\ /\\$/
		\ contained

" }}}
" comments {{{

syn match	proComment
		\ /#.*/

syn match	proComment
		\ /#.*$/
		\ contained

" }}}
" functions {{{

syn region	proParenthesis
		\ start=/(/
		\ end=/)/
		\ contains=proExpFuncArg,proParenthesis
		\ contained

syn region	proFunctionArgument matchgroup=proFunction
		\ start=/!\=[a-zA-Z][a-zA-Z0-9_]*(/
		\ end=/)/
		\ contains=proExpFuncArg,proParenthesis
		\ nextgroup=proScopeSeparator,proRegionScope

"
" These are the 'builtin' functions. They are disabled because I can't figure out how to
" have user functions (above) appear different (the pattern's aren't mutually exlusive)
"
"syn region	proFunctionArgument matchgroup=proFunction
"		\ start=/!\=\(requires\|exists\|unset\|eval\|CONFIG\|system\|return\|break\|next\|contains\|infile\|count\|isEmpty\|include\|load\|debug\|error\|message\|warning\|for\|defineTest\|defineReplace\)(/
"		\ end=/)/
"		\ skip=/(.\{-})/
"		\ nextgroup=proScopeSeparator,proRegionScope

" allow stuff like 'isEmpty(...):foo=bar'
syn match	proScopeSeparator /[:|]/
		\ nextgroup=proVariable,proScopeContent,proScope
		\ contained

" allow stuff like 'isEmpty(...) { foo=bar }'
syn region	proRegionScope	matchgroup=proScopeSeparator
		\ start=/\s*{/
		\ end=/}/
		\ nextgroup=proScope,proScopeContent
		\ transparent
		\ contained

" }}}

" this might be slow, but I don't understand the syncing mechanism good enough
" for the moment
if version >= 600
    syn sync fromstart
endif

" Define the default highlighting {{{

" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_pro_syn_inits")
    if version < 508
	let did_pro_syn_inits = 1
	command -nargs=+ HiLink hi link <args>
    else
	command -nargs=+ HiLink hi def link <args>
    endif

    HiLink proScopeSeparator	proScope

    HiLink proScope		Operator
    HiLink proVariable		Type
    HiLink proVarValue		String
    HiLink proExpFunc		PreProc
    HiLink proExpFuncArg	String
    HiLink proContinue		Operator

    HiLink proComment		PreProc

    HiLink proParenthesis	String
    HiLink proFunctionArgument	String
    HiLink proFunction		PreProc

    delcommand HiLink
endif

" }}}

" cleanup {{{

let b:current_syntax = "pro"

if version >= 600
    " restore cpo
    let &cpo = s:save_cpo
endif

" }}}

" vim: ts=8
