" Plugin Manager
call plug#begin()

Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/fatih/vim-go'
Plug 'https://github.com/junegunn/fzf'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" Plug 'github/copilot.vim'

" colorschemes
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/arcticicestudio/nord-vim'

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

colorscheme nord

if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark
else
    set termguicolors
    set background=light
endif

" vim-go
set completeopt-=preview
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_types = 1
let g:go_metalinter_autosave = 1

let g:NERDTreeWinSize=25

au filetype go inoremap <buffer> . .<C-x><C-o>
set completeopt=longest,menuone
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
