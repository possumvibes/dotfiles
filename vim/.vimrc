set nocompatible
filetype plugin on

" my settings
set number
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set termguicolors

colorscheme slate

" cursors for insert vs normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" bindings necessary for my hands to stay attached

let mapleader=","
nnoremap \ ,
map <leader>s :wincmd h<CR>
map <leader>t :wincmd j<CR>
map <leader>d :wincmd k<CR>
map <leader>h :wincmd l<CR>
map <leader>' :wincmd w<CR>
map <leader>. <C-w>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap <C-s> :write<cr>
inoremap <C-s> <C-o>:update<cr>