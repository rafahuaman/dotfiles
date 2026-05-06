set nocompatible

" vim-plug's Automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Call Plug 
call plug#begin('~/.vim/plugged')

" My bundles
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" All of your Plugins must be added before the following line
call plug#end()
filetype on
filetype plugin indent on 
syntax on


" General
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
set relativenumber
set numberwidth=5

set complete+=kspell


if (has("termguicolors"))
  set termguicolors
endif

" Switch colorscheme based on macOS system appearance
let s:appearance = system("defaults read -g AppleInterfaceStyle 2>/dev/null")
if s:appearance =~ "Dark"
  set background=dark
  let g:palenight_terminal_italics=1
  colorscheme palenight
else
  set background=light
  colorscheme catppuccin_latte
endif

" fzf (mirrors LazyVim defaults for easier future migration)
nnoremap <leader><leader> :Files<cr>    " find files
nnoremap <leader>/ :Ag<cr>              " live grep (ag)
nnoremap <leader>fb :Buffers<cr>        " find open buffers
nnoremap <leader>fg :GFiles<cr>         " find git-tracked files

" Source vimrc and install bundles
nmap <Leader>vi :source $MYVIMRC<cr>:PlugInstall<cr>
nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>vv :source $MYVIMRC<cr>

nmap <leader>dd :put =strftime('%Y-%m-%d')<cr>

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk
