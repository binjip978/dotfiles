" Plugin Manager
" TODO: remove package manager to ~/.vim/pack/vendor/start
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/tpope/vim-commentary'
Plugin 'https://github.com/fatih/vim-go'
Plugin 'https://github.com/junegunn/fzf'
Plugin 'https://github.com/junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'https://github.com/morhetz/gruvbox'


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

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab


set t_Co=256
set termguicolors
colorscheme gruvbox

if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark
else
    set background=light
endif


" vim-go
set completeopt-=preview
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_types = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'staticcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'staticcheck']
let g:go_metalinter_autosave = 1

let g:NERDTreeWinSize=25

au filetype go inoremap <buffer> . .<C-x><C-o>
set completeopt=longest,menuone

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
