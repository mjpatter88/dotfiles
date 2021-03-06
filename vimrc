set nocompatible
let mapleader= ","

" Do nvim specific things here
if has('nvim')
    set termguicolors
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    let g:gruvbox_italic=1

    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        let g:python3_host_prog='/Users/michael/.pyenv/versions/nvim/bin/python'
        let g:python_host_prog='/Users/michael/.pyenv/versions/nvim2/bin/python'
    else
        let g:python3_host_prog='/home/michael/.pyenv/versions/nvim/bin/python'
        let g:python_host_prog='/home/michael/.pyenv/versions/nvim2/bin/python'
    endif

    call plug#begin('~/.local/share/nvim/plugged')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'zchee/deoplete-jedi'
        Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'itchyny/lightline.vim'
        Plug 'sheerun/vim-polyglot'
        Plug 'tpope/vim-fugitive'
        Plug 'morhetz/gruvbox'
    call plug#end()

    " Autocomplete settings for deoplete and jedi
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#disable_auto_complete = 1

    inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
    function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
    endfunction"}}}

    " Show python docstring but close after selection
    let deoplete#sources#jedi#show_docstring = 1
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    " Mappings for fzf
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>f :Files<CR>

    " Remove bottom status line showing mode since we are using lightline.
    set noshowmode
    " Remap escape to get back to normal mode in virtual terminal
    tnoremap <Esc> <C-\><C-n>

endif

" Do OS specific things here
if has("gui_macvim")
    colorscheme gruvbox
    set background=dark
    set mouse=a             " Enable the mouse.
    set mh                  " Hide the mouse while typing.
    set gfn=Monaco:h12      " Use Monaco size 12.
    set linespace=-1        " Move the lines a bit closer togeter.

elseif has("win32")
	if has("gui_running")
		set guifont=Consolas:h13:cANSI
        set lines=60
        set columns=120
	endif

    " Place colorschemes for windows in: C:\Program Files (x86)\Vim\vim74\colors\
	colorscheme gruvbox " Use a nice colorscheme
	set background=dark " This colorscheme has both light and dark backgrounds

elseif has("unix")
	if has("gui_running")
		set guifont=Inconsolata\ 12
	endif

    set t_Co=256        " Make vim use 256 colors so colorschemes look right
	colorscheme gruvbox " Use a nice colorscheme
	set background=dark " This colorscheme has both light and dark backgrounds
    " Tomorrow and Tomorrow-Night are both good too
	"let g:seoul256_background = 234
	"colorscheme seoul256
	"colorscheme molokai
	"let g:solarized_termcolors=256
	"colorscheme solarized
	"set background=light
endif


" Configure correct tab behavior
set shiftwidth=4    " Make all tabs 4 spaces wide 
set tabstop=4 
set softtabstop=4
set expandtab       " Convert all tabs to spaces

" Detect the filetype and use automatic indenting based on the filetype.
filetype plugin indent on

set relativenumber  " Turn on relative numbering.
set number          " Turn on line numbers
syntax on           " Turn on syntax coloring
set nowrap          " Turn off word wrapping

"set cursorline      " Highlight the line with the cursor
set scrolloff=3     " Keep 3 lines above and below the cursor

" Use jk in place of escape (in insert mode). This is much quicker/easier to type.
inoremap jk <esc>

set incsearch       " Preview the search as you type it.
set ignorecase      " Ignore case when searching.
set smartcase       " If you type a capital letter, be case sensitive.

" Allows backspace to delete indentation, line break, etc.
set backspace=indent,eol,start

" <leader>v will now quickly select the most recently pasted text, since it
" often needs to be indented, etc.
nnoremap <leader>v V']

" Open a new vertical split and move to it by using <leader>w
nnoremap <leader>w <C-w>v<C-w>l

" Open a new horizontal split and move to it by using <leader>s
nnoremap <leader>s <C-w>s<C-w>j

" Use <leader> follwed by a direction to move around between splits
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Use <leader> follwed by =, <, or > to change the size of vertical splits
nnoremap <leader>= <C-w>=
nnoremap <leader>> <C-w>>
nnoremap <leader>< <C-w><

