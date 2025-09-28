" file: /home/cs/Dateien/src/github/cschult/vimrc-verylite/vimrc
" git: /home/cs/Dateien/src/github/cschult/vimrc-verylite
" author: Christian Schult cschult@demem.de 2025

" falls vim als easy-vim gestartet wird rc-file nicht lesen
if v:progname =~? "evim"
    finish
endif

" Use Vim defaults instead of 100% vi compatibility
" Avoid side-effects when nocompatible has already been set.
if &compatible
    set nocompatible
endif

" Vertical bar in insert mode (non-blinking)
"let &t_SI = "\<Esc>[6 q"
" Vertical bar in insert mode (blinking)
let &t_SI = "\<Esc>[5 q"
" Underline in replace mode (non-blinking)
"let &t_SR = "\<Esc>[4 q"
" Underline in replace mode (blinking)
let &t_SR = "\<Esc>[3 q"
" Block in other modes (non-blinking)
"let &t_EI = "\<Esc>[2 q"
" Block in other modes (blinking)
let &t_EI = "\<Esc>[1 q"

" netrw plugin disabled, no reading + writing files over the network
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

syntax on
filetype plugin indent on

" ensure that undo dir exists, because we're setting undodir
" and undofile later
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif

" O P T I O N S
" vim 9.0 on Debian 12 (Bookworm) has no autocomplete
if exists('&autocomplete')
    set autocomplete
endif
set autoindent
set autoread
set backup
set clipboard=unnamedplus
set cmdheight=2  " helps avoiding "hit enter" prompts
set expandtab
set helpheight=2
set hidden  " Hide buffers when they are abandoned
set history=1000
set hlsearch
set ignorecase
set incsearch  " Incremental search
set laststatus=2
set list  " whitespace sehen
set listchars=tab:▸·,trail:·,extends:»,precedes:«
set nowrap
set number  " setting number + relativenumber
set relativenumber  " enables hybrid line number mode
set scrolloff=2
set shortmess=a
set showmatch  " when a bracket is inserted, briefly jump to the matching one
set sidescrolloff=2
set signcolumn=yes
set smartcase  " Do smart case matching
set smartindent  " Do smart autoindenting when starting a new line.
set splitbelow  " splits always open below current window
set splitright  " splits always open right from current window
set tabstop=4
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set updatecount=50
set viminfo='1000,f1,\"1000,:50,@100,/20,n~/.viminfo
set whichwrap=<,>
if v:version < 901
    set wildmenu
endif

" format line
nnoremap Q gq
vnoremap Q gq

map ;; :%s:::gc<Left><Left><Left><Left>

" quick insertion of an empty line:
nmap <CR> o<ESC>

" Smart way to move between windows:
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" when you forgot to sudo before editing a file that requires root
cmap w!! w !sudo tee % >/dev/null

inoremap jk <esc>

