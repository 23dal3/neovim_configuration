-- ~/.config/nvim/lua/plugins/none_ls.lua
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "zeioth/none-ls-autoload.nvim",
    "zeioth/none-ls-external-sources.nvim"
  },
  config = function()
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
    'none-ls-external-sources.formatting.clang_format',
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

    require("null-ls").setup({
      diagnostics = {
        globals = { "vim" },  -- Add 'vim' as a recognized global for Lua linting
      },
    })
  end
}

