set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/junegunn/fzf'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

colorscheme gruvbox
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark
else
    set background=light
endif

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


nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
autocmd BufWritePre *.go lua vim.lsp.buf.format()

lua <<EOF

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
      vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    end
  })

end
    require'lspconfig'.gopls.setup{
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      settings = {
        gopls = {
          experimentalPostfixCompletions = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
      init_options = {
        usePlaceholders = true,
      }
    }

  require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
  }
EOF
