-- ~/.config/nvim/lua/themes/nebulous.lua

require("nebulous").setup {
  variant = "twilight",  -- Choose a theme variant ('fullmoon', 'twilight', 'midnight', etc.)
  disable = {
    background = true,       -- Disable setting the background color
    endOfBuffer = false,     -- Show '~' at the end of buffers
    terminal_colors = false, -- Don't apply colors to the terminal
  },
  italic = {
    comments   = false,      -- Don't italicize comments
    keywords   = true,       -- Italicize keywords
    functions  = false,      -- Don't italicize functions
    variables  = true,       -- Italicize variables
  },
  -- Custom color configuration
  custom_colors = {
    LineNr = { fg = "#5BBBDA", bg = "NONE", style = "NONE" },            -- Custom color for line numbers
    CursorLineNr = { fg = "#E1CD6C", bg = "NONE", style = "NONE" },       -- Custom color for current line number
    TelescopePreviewBorder = { fg = "#A13413" },                          -- Custom color for Telescope border
    LspDiagnosticsDefaultError = { bg = "#E11313" },                      -- Custom color for LSP errors
    TSTagDelimiter = { style = "bold,italic" },                           -- Custom style for Tree-sitter tag delimiters
  }
}

