" Options
set encoding=utf8
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set guifont=hack_nerd_font:h11
"set cc=100 " Show at 80 column a border for good code style                      
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim`:wq
set termguicolors

let g:kite_supported_languages = ['python', 'javascript']

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'nvimtools/none-ls.nvim'
Plug 'nvimtools/none-ls-extras.nvim'
Plug 'zeioth/none-ls-autoload.nvim', { 'do': ':MasonUpdate', 'on': 'BufEnter' }
Plug 'zeioth/none-ls-external-sources.nvim'

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ellisonleao/glow.nvim'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'm-demare/hlargs.nvim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/indentpython.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'williamboman/mason.nvim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'marko-cerovac/material.nvim'  " <-- This line added for Material theme
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
call plug#end()

let g:bargreybars_auto=0
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'
let NERDTreeQuitOnOpen=1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = '#'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = '#'
let g:material_style = "deep ocean"

colorscheme material
let g:airline_theme='deus'


autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

lua << EOF
require('glow').setup()
EOF

lua << EOF
require("mason").setup()
EOF

lua << EOF
require('hlargs').setup {
  color = "#ef9062", -- Set the color for the function parameters
  excluded_filetypes = {}, -- Add filetypes to exclude from highlighting
  paint_arg_declarations = true, -- Highlight the parameter declarations
  paint_arg_usages = true, -- Highlight the parameter usages
  hl_priority = 10000, -- Set highlight priority
  excluded_argnames = { declarations = {}, usages = {} }, -- Exclude certain argument names
}
EOF

lua << EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace the example names with the actual LSP servers you've installed
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}
require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}
EOF

lua << EOF
require('none-ls-autoload').setup({
  external_sources = {
    -- diagnostics
    'none-ls-external-sources.diagnostics.cpplint',
    'none-ls-external-sources.diagnostics.eslint',
    'none-ls-external-sources.diagnostics.eslint_d',
    'none-ls-external-sources.diagnostics.ruff',
    'none-ls-external-sources.diagnostics.luacheck',
    'none-ls-external-sources.diagnostics.shellcheck',
    'none-ls-external-sources.diagnostics.yamllint',

    -- formatting
    'none-ls-external-sources.formatting.autopep8',
    'none-ls-external-sources.formatting.beautysh',
    'none-ls-external-sources.formatting.easy-coding-standard',
    'none-ls-external-sources.formatting.eslint',
    'none-ls-external-sources.formatting.eslint_d',
    'none-ls-external-sources.formatting.jq',
    'none-ls-external-sources.formatting.latexindent',
    'none-ls-external-sources.formatting.reformat_gherkin',
    'none-ls-external-sources.formatting.rustfmt',
    'none-ls-external-sources.formatting.standardrb',
    'none-ls-external-sources.formatting.yq',

    -- code actions
    'none-ls-external-sources.code_actions.eslint',
    'none-ls-external-sources.code_actions.eslint_d',
    'none-ls-external-sources.code_actions.shellcheck',
  },
})
EOF
