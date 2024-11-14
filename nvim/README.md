
# My Neovim Configuration

Welcome to my Neovim setup! This configuration uses the Lazy plugin manager and is tailored for a modern, productive, and efficient development environment. It supports various programming languages and includes LSP, Treesitter, and formatting tools.

## Prerequisites

Before starting, make sure you have the following installed:

1. **Neovim (v0.9.0 or newer)**:
   ```bash
   nvim --version
   ```

2. **Git** (for plugin management):
   ```bash
   sudo apt install git
   ```

3. **Node.js and npm** (optional, for LSP support in JavaScript/TypeScript):
   ```bash
   sudo apt install nodejs npm
   ```

4. **Python** (optional, for Python LSP support):
   ```bash
   sudo apt install python3 python3-pip
   ```

5. **Ripgrep** (optional, recommended for Telescope fuzzy finder):
   ```bash
   sudo apt install ripgrep
   ```

## Installation

1. **Clone this repository to your Neovim configuration directory**:
   ```bash
   git clone https://github.com/23dal3/neovim-config ~/.config/nvim
   ```

2. **Install the Lazy plugin manager**:
   ```bash
   curl -sSLo ~/.local/share/nvim/lazy/lazy.nvim --create-dirs \
   https://github.com/folke/lazy.nvim/releases/latest/download/lazy.nvim
   ```

3. **Install plugins using Lazy**:
   Open Neovim and run:
   ```vim
   :Lazy install
   ```

4. **Install LSP servers**:
   Open Neovim and run the Mason installer:
   ```vim
   :Mason
   ```
   Then install the required LSP servers (e.g., `pyright`, `tsserver`, `clangd`).

## Configuration Structure

The configuration is organized into several Lua files for modularity and easier maintenance:

- `~/.config/nvim/init.lua`: Main entry point, loads all configurations.
- `~/.config/nvim/lua/plugins/init.lua`: Lazy plugin setup.
- `~/.config/nvim/lua/plugins/lsp.lua`: LSP settings and configurations.
- `~/.config/nvim/lua/plugins/theme.lua`: Custom theme settings (e.g., Catppuccin, Nebulous).
- `~/.config/nvim/lua/plugins/telescope.lua`: Configuration for Telescope fuzzy finder.
- `~/.config/nvim/lua/plugins/none-ls.lua`: Configuration for diagnostics and formatting tools.
- `~/.config/nvim/lua/ui.lua`: UI enhancements and configurations.

## Key Features

- **Lazy Plugin Management**: Fast and efficient plugin loading with Lazy.
- **LSP Support**: Language Server Protocol (LSP) integration for code completion, diagnostics, and more.
- **Treesitter**: Advanced syntax highlighting and code parsing.
- **Telescope**: Powerful fuzzy finder for files, buffers, and more.
- **Auto-formatting**: Configured with `none-ls.nvim` for formatting and diagnostics (supports Flake8, cpplint, eslint, etc.).
- **Custom Theme**: Aesthetic and readable theme customization (Catppuccin with custom highlight groups).
- **Integrated Terminal Support**: Seamless integration with tmux.

## Usage

### Common Commands

#### Plugin Management

- Install plugins: `:Lazy install`
- Update plugins: `:Lazy update`
- Check plugin health: `:checkhealth`

#### LSP Commands

- Open LSP info: `:LspInfo`
- Format file: `:lua vim.lsp.buf.format()`
- Show diagnostics: `:lua vim.diagnostic.open_float()`

#### Telescope Commands

- Find files: `:Telescope find_files`
- Live grep: `:Telescope live_grep`
- Buffer search: `:Telescope buffers`

#### Git Integration

- View git status: `:Gitsigns status`
- Stage hunk: `:Gitsigns stage_hunk`
- Undo stage hunk: `:Gitsigns undo_stage_hunk`

## Keyboard Shortcuts

| Action                        | Shortcut       |
|-------------------------------|----------------|
| Save file                     | `Ctrl-S`       |
| Open file tree                | `<leader>e`    |
| Find files (Telescope)        | `<leader>ff`   |
| Live grep (Telescope)         | `<leader>fg`   |
| LSP code action               | `<leader>ca`   |
| Format file                   | `<leader>f`    |
| Toggle terminal (tmux)        | `<leader>t`    |

## Customization

- **Theme**: Customize the appearance in `~/.config/nvim/lua/plugins/theme.lua`. You can change the color scheme or modify highlight groups.
- **UI Settings**: Modify `~/.config/nvim/lua/ui.lua` for tweaks like icons, status line, and more.
- **LSP Servers**: Add or remove LSP servers in `~/.config/nvim/lua/plugins/lsp.lua`.

## Troubleshooting

1. **Plugin not loading**:
   - Run `:Lazy check` to see if there are any issues.
   - Try running `:Lazy clean` and then `:Lazy install` again.

2. **LSP server not starting**:
   - Make sure the LSP server is installed via Mason (`:Mason`).
   - Check if the correct file type is supported by the LSP server.

3. **Performance issues**:
   - Disable unused plugins in `~/.config/nvim/lua/plugins/init.lua`.
   - Reduce Treesitter modules for specific languages if necessary.

## Updating the Configuration

To update the configuration, simply pull the latest changes from GitHub:
```bash
cd ~/.config/nvim
git pull origin main
```

## Contributing

Feel free to fork this repository and make your own changes. Pull requests are welcome!

## License

This Neovim configuration is open-source and available under the MIT License.
