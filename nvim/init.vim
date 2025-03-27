set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sago35/tinygo.vim'
Plug 'https://github.com/folke/trouble.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }

Plug 'https://github.com/p00f/alabaster.nvim'
Plug 'https://github.com/arcticicestudio/nord-vim'
call plug#end()

filetype plugin indent on
syntax enable

" set number
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set ignorecase
set smartcase
set incsearch
set backspace=indent,eol,start
set clipboard=unnamed

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

set termguicolors

if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    colorscheme nord
    set background=dark
else
    colorscheme alabaster
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

nmap <C-P> <cmd>Telescope find_files<CR>
nmap <C-x><C-p> <cmd>Telescope lsp_document_symbols<CR>

nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>

lua <<EOF

vim.cmd([[highlight WinSeparator guifg=#444444]])

local on_attach = function(client, bufnr)
    vim.diagnostic.config({
        signs = false;
        underline = true;
    })

    vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

    vim.o.updatetime = 750
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function()
            pcall(function()
                vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' }, diagnostics = {} }, apply = true }
                vim.lsp.buf.format()
            end)
        end,
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
                unusedwrite = true
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

require'trouble'.setup {
--     icons = false
}

EOF
