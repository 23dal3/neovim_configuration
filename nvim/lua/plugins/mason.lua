-- ~/.config/nvim/lua/plugins/mason.lua
return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
}

