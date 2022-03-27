set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/chriskempson/base16-vim'
Plug 'https://github.com/junegunn/fzf'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/vim-goimports'
call plug#end()

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
" if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
"     colorscheme base16-gruvbox-dark-pale
" else
" endif
colorscheme gruvbox

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

" let g:go_fmt_command = "goimports"
" let g:go_gopls_enabled = 0

lua <<EOF
  require'lspconfig'.gopls.setup{}

  require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
  }
EOF

nmap <silent> gd <Plug>(coc-definition)
