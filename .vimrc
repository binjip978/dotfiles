set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'
Plugin 'https://github.com/pangloss/vim-javascript'
Plugin 'https://github.com/tpope/vim-commentary'
Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'https://github.com/Shougo/neocomplete.vim'

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

syntax enable

set t_Co=256
" set background=light
set background=dark
" colorscheme cosmic_latte
set termguicolors
let base16colorspace=256 
colorscheme base16-onedark

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let g:NERDTreeDirArrows=0
set laststatus=2

" cntr-p
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*/target/*",*.class,*.so,*.swp,*.zip,*.class     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|target)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll|class)$'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

"Neocomplete
let g:neocomplete#enable_at_startup = 1

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
