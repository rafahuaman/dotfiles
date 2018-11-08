set nocompatible

" Call Plug 
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" My bundles
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call plug#end()
filetype on
filetype plugin indent on 
syntax on


" General
set background=dark
colorscheme palenight

let mapleader = " "

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set ruler " show the cursor position all the time
set grepprg=ag " Use Silver Searcher instead of grep
set showcmd       " display incomplete commands

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

set complete+=kspell


if (has("termguicolors"))
  set termguicolors
endif
let g:palenight_terminal_italics=1

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s --files-with-matches --nocolor --hidden --filename-pattern ""'
let g:ctrlp_use_caching = 1

" Source vimrc and install bundles
nmap <Leader>vi :source $MYVIMRC<cr>:PlugInstall<cr>
nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>vv :source $MYVIMRC<cr>

nmap <leader>dd :put =strftime('%Y-%m-%d')<cr>

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk
