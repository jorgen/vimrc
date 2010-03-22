" Vim global plugin to run and store command output to buffer (i.e) :Do ls -l
" Maintainer: Girish Ramakrishnan <girish@trolltech.com>

if exists("do_command")
    finish
endif
let do_command = 1

if !exists(":Do")
    command -nargs=+ Do :call s:Do(<q-args>)
endif

function s:GetBuffer()
    " Use an existing "do" window if it exists, otherwise open a new one.
    if &filetype != "do"
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

    silent execute "enew"

    setl buftype=nofile
    setl nobuflisted
    setl bufhidden=hide
    setl nomodifiable
    setl filetype=do
endfunction

function s:Do(command)
    call s:GetBuffer()

    setl modifiable
    exe "r !" . a:command

    setl nomodifiable
endfunction

