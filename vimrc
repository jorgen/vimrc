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
set cino+=g0
set cino+=(0
set cino+=:0
set cino+=l1
set path=,$BS_VIM_SEARCH_PATH/**

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

