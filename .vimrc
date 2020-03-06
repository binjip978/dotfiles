" Plugin Manager
" TODO: remove package manager to ~/.vim/pack/vendor/start
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/tpope/vim-commentary'
Plugin 'https://github.com/chriskempson/base16-vim'

call vundle#end()
" Plugin manager end

filetype plugin indent on
syntax enable

set number
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set ignorecase
set smartcase
set incsearch
set backspace=indent,eol,start
set clipboard=unnamedplus

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set t_Co=256
set termguicolors
colorscheme base16-solarized-light
" set background=dark
" magic for tmux vim and termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" hardmode on
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
