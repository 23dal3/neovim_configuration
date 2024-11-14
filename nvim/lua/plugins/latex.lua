-- ~/.config/nvim/lua/plugins/latex.lua

return {
  'lervag/vimtex',
  config = function()
    vim.g.vimtex_view_method = 'skim' -- Set Skim as the PDF viewer
    vim.g.vimtex_compiler_method = 'latexmk' -- Use latexmk for LaTeX compilation
    vim.g.vimtex_syntax_enabled = 1 -- Enable syntax highlighting for LaTeX
    vim.g.vimtex_quickfix_mode = 0 -- Disable the quickfix window by default

    -- Configure Skim with SyncTeX for proper forward search
    vim.g.vimtex_view_general_viewer = 'open -a Skim'
    vim.g.vimtex_view_general_options = [[--args -r]]

    -- Enable shell escape in latexmk options
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-shell-escape',
        '-pdf',
        '-interaction=nonstopmode',
        '-synctex=1'
      }
    }
  end
}
