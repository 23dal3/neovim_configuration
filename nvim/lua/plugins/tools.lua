-- ~/.config/nvim/lua/plugins/tools.lua
return {
  { "mbbill/undotree" },
  { 'wakatime/vim-wakatime', lazy = false },
  { "tpope/vim-fugitive" },
  { "junegunn/vim-easy-align" },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- or your preferred dependencies
    opts = {},
  },
}

