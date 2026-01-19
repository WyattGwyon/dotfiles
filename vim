" Enable syntax highlighting
syntax on

inoremap {<CR> {<CR>}<Esc>O<Tab>
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap <expr> <silent> ) getline('.')[col('.') - 1] == ')' ? "\<Right>" : ")"
inoremap <expr> <silent> ] getline('.')[col('.') - 1] == ']' ? "\<Right>" : "]"

set mouse=a
set nowrap
set number
set tabstop=4
set rnu
set cursorline
set cursorcolumn
set autoindent
highlight CursorLine cterm=NONE ctermbg=236 guibg=#2c2c2c
set colorcolumn=81
set laststatus=2
highlight StatusLine guibg=#5f5f5f guifg=white
highlight StatusLineNC guibg=#2e2e2e guifg=#aaaaaa
set list
set listchars=tab:→\ ,trail:·,extends:>,precedes:<,nbsp:%

" Allows :wa to save all open vims tabs in window
set autowriteall

" Highlights matching brackets
set showmatch

xnoremap <leader>c :s/^/\/\//<CR>
xnoremap <leader>u :s/^\/\/\s\?//<CR>

