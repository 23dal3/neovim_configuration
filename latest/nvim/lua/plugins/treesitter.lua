-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "javascript", "lua", "vim", "python", "markdown", "bash", "markdown_inline", "cpp", "comment" },
      highlight = {
        enable = true,
        disable = { "latex", },
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}

