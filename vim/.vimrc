" Enable syntax highlighting
syntax on

" Enable filetype detection and plugin support
filetype plugin indent on

" Use spaces instead of tabs
set expandtab

" Set the number of spaces a tab counts for
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Enable automatic indentation
set autoindent
set smartindent
set cindent

" Highlight matching bracket
set showmatch

" Line numbers (optional, but nice)
set number
set relativenumber

" Allow mouse scrolling and cursor placement 
set mouse=a

set autowriteall

set cursorcolumn
set cursorline

set colorcolumn=81
set list
set listchars=tab:→\ ,trail:·,extends:>,precedes:<,nbsp:%
highlight CursorLine cterm=NONE ctermbg=236 guibg=#2a2a2a

inoremap {<CR> {<CR>}<Esc>O
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap <expr> <silent> ) getline('.')[col('.') - 1] == ')' ? "\<Right>" : ")"
inoremap <expr> <silent> ] getline('.')[col('.') - 1] == ']' ? "\<Right>" : "]"
inoremap <expr> <silent> ' (strpart(getline('.'), col('.') - 1, 1) ==# "'" ? "\<Right>" : "''\<Left>")
inoremap <expr> <silent> " (strpart(getline('.'), col('.') - 1, 1) ==# '"' ? "\<Right>" : "\"\"\<Left>")

