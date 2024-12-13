-- Set options
vim.opt.encoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "noinsert", "menuone", "noselect" }
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.wildmenu = true
vim.opt.guifont = "hack_nerd_font:h11"
vim.opt.syntax = "on"
vim.opt.spell = true
vim.opt.ttyfast = true
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true



-- Set tabs to 4 spaces
vim.opt.tabstop = 4       -- Number of visual spaces per TAB
vim.opt.shiftwidth = 4    -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.softtabstop = 4   -- Number of spaces a <Tab> counts for while editing

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Plugin manager initialization
require("config.lazy")
require("themes.kanagawa")
-- Define custom diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",  { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint",  { text = "", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo",  { text = "", texthl = "DiagnosticSignInfo" })
vim.diagnostic.config({
  virtual_text = {
    prefix = "", -- Use no prefix to let the virtual text directly reflect the diagnostic type
    format = function(diagnostic)
      local symbols = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = " ",
      }
      return symbols[diagnostic.severity] .. diagnostic.message
    end,
    spacing = 2, -- Adjust spacing between virtual text and code
  },
  signs = true,   -- Keep diagnostic signs in the gutter
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Keymaps
vim.api.nvim_set_keymap("n", "<Leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })

-- Mapping to save the file using <Leader>w
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

-- Mapping to close the buffer using <Leader>q
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })

-- Mapping to close the buffer with save using <Leader>x
vim.api.nvim_set_keymap('n', '<Leader>x', ':x<CR>', { noremap = true, silent = true })

-- Map <Leader>v to :vsplit
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<CR>', { noremap = true, silent = true })

-- Map <Leader>h to :split (horizontal split)
vim.api.nvim_set_keymap('n', '<Leader>h', ':split<CR>', { noremap = true, silent = true })

-- Map Ctrl-S to :wq
vim.api.nvim_set_keymap('n', '<C-s>', ':wq<CR>', { noremap = true, silent = true })

-- Map <Leader>e to :Explore
vim.api.nvim_set_keymap('n', '<Leader>e', ':Explore<CR>', { noremap = true, silent = true })

