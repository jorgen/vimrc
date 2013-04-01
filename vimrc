let c_space_errors=1
syn on
filetype on
filetype plugin on
autocmd FileType * set formatoptions=tcql nocindent& 
autocmd FileType c,cpp set cindent 
set autowrite
set incsearch
set noeol
set modeline
set modelines=10
set cmdheight=3
set backspace=2
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set ignorecase
set smartcase
set errorformat=%f:%l:%m
set sm
set ruler
set title
set hidden
" Rainer's p4 plugin
runtime ftplugin/p4.vim
" The great 'a plugin' to switch between header/source
runtime ftplugin/a.vim
" The taglist plugin 
runtime ftplugin/taglist.vim
set tags=./tags,tags,$QTSRCDIR/src/tags,$QTDIR/src/tags

" allow vim find to find a Qt source file anytime w/o knowing the directory" layout
set path=,$QTSRCDIR/src/**,$QTDIR/src/**
" a reasonable color scheme
set tags=./tags,tags,$QTSRCDIR/src/tags,$QTDIR/src/tags

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set number
" Allow us to remeber our place in a file.
if has("autocmd")
autocmd BufReadPost *
\ if (getline(1) !~ '# A Perforce.*') && (getline(2) !~ '# THIS BRANCH') && line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
endif

" smart cd
map ,cd :lcd %:p:h<CR>

" Allow to load in your own items
if filereadable(expand("$HOME/.myvimrc"))
    source $HOME/.myvimrc
endif

call pathogen#infect() 

"lldb shortcuts
map <F6> :Lbreakpoint<CR>
map <F7> :Lstepin<CR>
map <F8> :Lnext<CR>
map <F9> :Lfinish<CR>
map <F10> :Lcontinue<CR>
