-- ~/.config/nvim/lua/plugins/tools.lua
return {
  { "mbbill/undotree" },
  { "tpope/vim-fugitive" },
  { "junegunn/vim-easy-align" },
  { "tpope/vim-commentary" },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- or your preferred dependencies
    opts = {},
  },
}

