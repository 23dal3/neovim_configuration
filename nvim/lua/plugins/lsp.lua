-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Define/extend configs
    vim.lsp.config('ts_ls', { capabilities = capabilities })
    vim.lsp.config('basedpyright', {
      capabilities = capabilities,
      settings = { python = { analysis = { typeCheckingMode = "strict" } } },
    })
    vim.lsp.config('clangd', { capabilities = capabilities })
    vim.lsp.config('texlab', { capabilities = capabilities })
    vim.lsp.config('rust_analyzer', {
      capabilities = capabilities,
      settings = { ["rust-analyzer"] = { diagnostics = { enable = true } } },
    })

    -- Enable them (order doesn’t matter)
    vim.lsp.enable({ 'ts_ls', 'basedpyright', 'clangd', 'texlab', 'rust_analyzer' })
  end,
}
