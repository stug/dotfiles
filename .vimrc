set nocompatible

let python_highlight_all = 1

set background=dark
colorscheme solarized

syntax enable
set number				" line numbers
set showmode			" always display the current mode
set laststatus=2		" always show statusline

" indentation
set tabstop=4			" tabs are 4 spaces wide
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set autoread			" automatically reload changed files (e.g. on checkout)

" no backup
set nobackup
set nowritebackup
set noswapfile

" search
set ignorecase
set smartcase			" uppercase only matches uppercase
set hlsearch			" highlight matches
set incsearch			" search as you type

set colorcolumn=80

function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Ctrl + movement key changes buffer
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
