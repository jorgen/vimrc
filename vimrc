set shiftwidth=2
set expandtab
set ignorecase
set incsearch
set hidden
set autowrite
set makeprg=ninja
set number

map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

call plug#end()
