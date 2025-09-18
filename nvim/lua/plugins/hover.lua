-- ~/.config/nvim/lua/plugins/hover.lua
return {
  "lewis6991/hover.nvim",
  config = function()
    require("hover").setup {
      init = function()
        require("hover.providers.lsp")
      end,
      preview_opts = { border = "single" },
      preview_window = false,
      title = true,
    }
    vim.api.nvim_set_keymap("n", "K", ":lua require('hover').hover()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "gK", ":lua require('hover').hover_select()<CR>", { noremap = true, silent = true })
  end
}

