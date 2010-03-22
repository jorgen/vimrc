" Vim global plugin for p4 integration
" Maintainer: Rainer M. Schmid <rms@trolltech.com>
" Version: $Id: p4.vim,v 1.18 2003/02/27 16:44:48 rms Exp $

"--------------------------------------------
" Local mappings
"--------------------------------------------
" local mappings and initialization {{{

if &filetype == "p4"
    " Only do this when not done yet for this buffer
    if exists("b:did_ftplugin")
	finish
    endif
    let b:did_ftplugin = 1

    " Add mappings, unless the user didn't want this.
    if !exists("no_plugin_maps") && !exists("no_p4_maps")
"	if !hasmapto('<Plug>ManBS')
"	    nmap <buffer> <LocalLeader>h <Plug>ManBS
"	endif
"	nnoremap <buffer> <Plug>ManBS :%s/.\b//g<CR>:set nomod<CR>''

	nnoremap <buffer> <c-]> :call <SID>Describe(expand('<cword>'))<CR>
	nnoremap <buffer> <c-t> :call <SID>PopPage()<CR>
    endif
endif

if !exists("p4_command")
    let s:p4_command = "p4"
else
    let s:p4_command = p4_command
endif

" }}}

"--------------------------------------------
" Global mappings and commands
"--------------------------------------------
" general (global) initialization {{{

if exists("s:p4_tag_depth")
    finish
endif
let s:p4_tag_depth = 1

" save cpo (we use line-continuation)
let s:save_cpo = &cpo
set cpo&vim

" }}}

" <Leader> Mappings {{{

if !hasmapto('<Plug>P4Edit')
    map <unique> <Leader>e <Plug>P4Edit
endif

if !hasmapto('<Plug>P4Revert')
    map <unique> <Leader>r <Plug>P4Revert
endif

if !hasmapto('<Plug>P4Filelog')
    map <unique> <Leader>f <Plug>P4Filelog
endif

if !hasmapto('<Plug>P4Diff')
    map <unique> <Leader>d <Plug>P4Diff
endif

if !hasmapto('<Plug>P4Annotate')
    map <unique> <Leader>a <Plug>P4Annotate
endif

" }}}
" <Plug> Mappings {{{

noremap <unique> <script> <Plug>P4Edit <SID>Edit
noremap <SID>Edit :call <SID>Edit(expand("%:p"))<CR>

noremap <unique> <script> <Plug>P4Revert <SID>Revert
noremap <SID>Revert :call <SID>Revert(expand("%:p"))<CR>

noremap <unique> <script> <Plug>P4Filelog <SID>Filelog
noremap <SID>Filelog :call <SID>Filelog(expand("%:p"))<CR>

noremap <unique> <script> <Plug>P4Diff <SID>Diff
noremap <SID>Diff :call <SID>Diff(expand("%:p"))<CR>

noremap <unique> <script> <Plug>P4Annotate <SID>Annotate
noremap <SID>Annotate :call <SID>Annotate(expand("%:p"))<CR>

" }}}
" Commands {{{

if !exists(":Pdiff")
    command -nargs=? Pdiff call <SID>Diff(<f-args>)
endif

if !exists(":Psync")
    command -nargs=? Psync call <SID>Sync(<f-args>)
endif

if !exists(":Pdescribe")
    command -nargs=1 Pdescribe call <SID>Describe(<f-args>)
endif

if !exists(":Pannotate")
    command -nargs=1 Pannotate call s:Annotate(<f-args>)
endif

" }}}


"--------------------------------------------
" Functions
"--------------------------------------------

" Functions with direct global mappings or commands
" Edit( filename ) {{{

function s:Edit( filename )
    " the dummy autocmd together with  the checktime call prohibit vim from
    " asking to reload the file when you do a checkout
    autocmd FileChangedShell * let s:foobarDummy=3
    silent execute "!".s:p4_command." edit ".s:GetDepotName(a:filename)
    silent execute "checktime ".a:filename
    setl noro
    setl swapfile
    redraw!
    autocmd! FileChangedShell *
endfunction

" }}}
" Revert( filename ) {{{

function s:Revert( filename )
    " the dummy autocmd together with  the checktime call prohibit vim from
    " asking to reload the file when you do a checkout
    autocmd FileChangedShell * let s:foobarDummy=3
    silent execute "!".s:p4_command." revert ".s:GetDepotName(a:filename)
    silent execute "checktime ".a:filename
    setl noro
    setl swapfile
    redraw!
    autocmd! FileChangedShell *
    execute "e"
endfunction

" }}}
" Filelog( filename ) {{{

function s:Filelog( filename )
    call s:GetBuffer()

    setl modifiable
    execute "r!".s:p4_command." filelog -l ".s:GetDepotName(a:filename)
    setl nomodifiable

    execute "normal 1G"
endfunction

" }}}
" Diff( ... ) {{{

function s:Diff( ... )
    call s:GetBuffer()
    setl syntax=diff

    setl modifiable
    if a:0 == 0
	execute "r!".s:p4_command." diff -du"
    elseif a:0 == 1
	execute "r!".s:p4_command." diff -du ".s:GetDepotName(a:1)
    endif
    setl nomodifiable

    execute "normal 1G"
endfunction

" }}}
" Sync( ... ) {{{

function s:Sync( ... )
    if a:0 == 0
	execute "!".s:p4_command." sync ".s:GetDepotName(expand("%:p"))
    elseif a:0 == 1
	execute "!".s:p4_command." sync ".s:GetDepotName(expand("%:p"))."\\#".a:1
    endif
    checktime
endfunction

" }}}
" Annotate( filename ) {{{

function s:Annotate( filename )
    let s:saveLine = line(".")
    let s:depotName= s:GetDepotName(a:filename)
    "let s:saveSyntax = &syntax

    call s:GetBuffer()

    setl modifiable
    " do the p4 annotate
    execute "r!".s:p4_command." annotate -q ".s:depotName
    execute "normal 1G"
    execute "normal dd"
    " merge the result with a p4 filelog
    let s:mergeCommands = system( s:p4_command." filelog ".s:depotName )
    let s:mergeCommands = substitute(
	\ s:mergeCommands,
	\ '\.\.\. \.\.\.'."[^\n]*\n",
	\ '',
	\ "g" )
    let s:mergeCommands = substitute(
	\ s:mergeCommands,
	\ '\([^@]@\)'."[^\n]*\n",
	\ '\1',
	\ "g" )
    let s:mergeCommands = substitute(
	\ s:mergeCommands,
	\ '[^#]*#\(\d*\) change \(\d*\)\S* \S* on \S* by \([^@]*\)@',
	\ '%s/^\1:/ \2 \3\t:/e\n',
	\ "g" )
    silent execute s:mergeCommands
    setl nomodifiable

    execute "normal ".s:saveLine."G"
    "let &syntax = s:saveSyntax

    unlet s:saveLine
    unlet s:depotName
    unlet s:mergeCommands
    "unlet s:saveSyntax
endfunction

" }}}
" Describe( changenumber ) {{{

function <SID>Describe( changenumber )
    call s:GetBuffer()
    setl syntax=diff

    setl modifiable
    silent execute "r!".s:p4_command." describe -du ".a:changenumber
    setl nomodifiable

    execute "normal 1G"
endfunction

" }}}

" Functions with local mappings
" PopPage() {{{

function <SID>PopPage()
    if s:p4_tag_depth > 0
	let s:p4_tag_buf_old = bufnr("%")

	let s:p4_tag_depth = s:p4_tag_depth - 1
	execute "let s:p4_tag_buf=s:p4_tag_buf_".s:p4_tag_depth
	execute "let s:p4_tag_lin=s:p4_tag_lin_".s:p4_tag_depth
	execute "let s:p4_tag_col=s:p4_tag_col_".s:p4_tag_depth

	execute s:p4_tag_buf."b"
	execute s:p4_tag_lin
	execute "norm ".s:p4_tag_col."|"

	execute "unlet s:p4_tag_buf_".s:p4_tag_depth
	execute "unlet s:p4_tag_lin_".s:p4_tag_depth
	execute "unlet s:p4_tag_col_".s:p4_tag_depth
	unlet s:p4_tag_buf s:p4_tag_lin s:p4_tag_col

	execute s:p4_tag_buf_old."bwipeout"
	unlet s:p4_tag_buf_old
    endif
endfunc

" }}}

" Helper functions
" GetBuffer() {{{

function s:GetBuffer()
    " Use an existing "p4" window if it exists, otherwise open a new one.
    if &filetype != "p4"
	let thiswin = winnr()
	execute "norm! \<C-W>b"
	if winnr() == 1
	    new
	else
	    execute "norm! " . thiswin . "\<C-W>w"
	    while 1
		if &filetype == "p4"
		    break
		endif
		execute "norm! \<C-W>w"
		if thiswin == winnr()
		    new
		    break
		endif
	    endwhile
	endif
    endif

    " push the buffer
    execute "let s:p4_tag_buf_".s:p4_tag_depth." = ".bufnr("%")
    execute "let s:p4_tag_lin_".s:p4_tag_depth." = ".line(".")
    execute "let s:p4_tag_col_".s:p4_tag_depth." = ".col(".")
    let s:p4_tag_depth = s:p4_tag_depth + 1

    silent execute "enew"

    setl buftype=nofile
    setl nobuflisted
    setl bufhidden=hide
    setl nomodifiable
    setl filetype=p4
endfunction

" }}}
" GetDepotName() {{{

function s:GetDepotName( filename )
    return substitute( system( s:p4_command." where ".resolve(a:filename) ), " .*$", "", "" )
endfunction

" }}}


" Cleanup {{{

" restore cpo
let &cpo = s:save_cpo

" }}}

" vim600:foldmethod=marker
