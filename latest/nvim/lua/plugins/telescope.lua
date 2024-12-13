-- ~/.config/nvim/lua/plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",  -- Use specific version 0.1.5 of Telescope

    dependencies = {
        "nvim-lua/plenary.nvim"  -- Ensure Plenary is installed (required by Telescope)
    },

    config = function()
        -- Setup Telescope with default configuration
        require('telescope').setup({})

        -- Load built-in functions from Telescope
        local builtin = require('telescope.builtin')

        -- Key Mappings for Telescope:

        -- <leader>pf: Find files in the current working directory
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

        -- <C-p>: Search for Git-tracked files (only inside a Git repository)
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})

        -- <leader>pws: Grep for the current word under the cursor in the project
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)

        -- <leader>pWs: Grep for the "WORD" under the cursor (includes non-alphanumeric characters)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        -- <leader>ps: Prompt user to input a string to grep within the project
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        -- <leader>vh: Open Neovim's help tags and search for help topics
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}

