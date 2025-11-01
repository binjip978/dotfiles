" Plugin Manager
call plug#begin()

Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/junegunn/fzf'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'

" colorschemes
Plug 'https://github.com/binjip978/nord-ghostty'
Plug 'https://github.com/agudulin/vim-colors-alabaster'

call plug#end()

set nocompatible
filetype off
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
set wildmenu

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    colorscheme nord
    set background=dark
else
    set background=light
endif

let g:NERDTreeWinSize=25

" set spell spelllang=en_gb

" hardmode on
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
let &t_ut=''

" ctrlp ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*

set rtp+=/usr/local/opt/fzf
nmap <C-P> :FZF<CR>
