set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'https://github.com/tpope/vim-commentary'

Plugin 'https://github.com/chriskempson/base16-vim'

call vundle#end()            " required
filetype plugin indent on

set nu
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set backspace=indent,eol,start
" set clipboard=unnamedplus

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

syntax enable

set t_Co=256
colorscheme base16-solarized-dark
" set background=dark
" magic for tmux vim and termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
