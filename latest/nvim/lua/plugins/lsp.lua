-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    require('lspconfig')['ts_ls'].setup {
      capabilities = capabilities,
    }
    require('lspconfig')['pyright'].setup {
      capabilities = capabilities,
    }
    require('lspconfig')['clangd'].setup {
      capabilities = capabilities,
    }
  end
}

