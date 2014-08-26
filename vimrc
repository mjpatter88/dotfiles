set nocompatible    " Don't need compatability with vi

set shiftwidth=4    " Make all tabs 4 spaces wide 
set tabstop=4 
set softtabstop=4
set expandtab       " Convert all tabs to spaces

" Detect the filetype and use automatic indenting based on the filetype.
filetype plugin indent on

set number          " Turn on line numbers
set t_Co=256        " Make vim use 256 colors so colorschemes look right
syntax on           " Turn on syntax coloring

"colorscheme gruvbox " Use a nice colorscheme
"set background=dark " This colorscheme has both light and dark backgrounds
"let g:seoul256_background = 234
"colorscheme seoul256
colorscheme molokai

set cursorline      " Highlight the line with the cursor
set scrolloff=3     " Keep 3 lines above and below the cursor

" Use jk in place of escape. This is much quicker/easier to type.
inoremap jk <esc>

" Switch colon and semicolon to make it much quicker/easier to enter commands.
nnoremap ; :
nnoremap : ;

set incsearch       " Preview the search as you type it.
set ignorecase      " Ignore case when searching.
set smartcase       " If you type a capital letter, be case sensitive.

" Allows backspace to delete indentation, line break, etc.
set backspace=indent,eol,start
