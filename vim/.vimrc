set nocompatible
filetype plugin indent on
syntax enable

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set number          " show line numbers all the time
set cursorline    " highlight  the  cursor line
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set wildmenu		" display completion matches in a status line

" searching
set ignorecase      " ignore case in searches by default
set smartcase       " case-sensitive search if any capitals are typed
set incsearch       " do incremental searching

" tab settings
set expandtab       " enter spaces instead of tab character
set tabstop=2
set shiftwidth=2

" Show @@@ in the last line if it is truncated.
set display=truncate
set scrolloff=8     " buffer from scrolling to the bottom/top

" colors
set termguicolors 
colorscheme slate

" cursors for insert vs normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" highlight "strings" in comments
let c_comment_strings=1

" enable mouse if reasonable (from vim default config)
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

" Don't override the register on x or s
nnoremap x "_x
nnoremap s "_s

" u/U for undo/redo
nnoremap U <C-r>  

" quick way to turn off highlighting
nnoremap <bs> :nohl<cr>

" convenience: %% becomes current directory in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" map C-U to break the undo (<C-G>u) before clearing the line
inoremap <C-U> <C-G>u<C-U>

" Continue indenting in visual mode
xnoremap < <gv
xnoremap > >gv

" * and # in visual mode
xnoremap * "jy/<C-r>j<CR>
xnoremap # "jy?<C-r>j<CR>

" Leader key
let mapleader=" "
map <leader>g :write<cr>
map <leader>v :source $MYVIMRC<cr>

" window movement: minor mode off of -
nnoremap -s :wincmd h<CR>
nnoremap -t :wincmd j<CR>
nnoremap -d :wincmd k<CR>
nnoremap -h :wincmd l<CR>
nnoremap -- <C-w>p
