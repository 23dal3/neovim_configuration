# 🛠 Neovim Configuration

This is my personal Neovim configuration, built for **speed**, **modern plugin management** with [Lazy.nvim](https://github.com/folke/lazy.nvim), and strong support for **LSP**, **completion**, and **LaTeX editing**.

Supports **macOS** and **Linux** (no Windows support).

---

## 📦 Prerequisites

### Common (macOS & Linux)

- **Neovim** ≥ 0.9 (v0.10+ recommended)
- **Git** – required for plugin installation
- **Node.js** – for LSP servers & Tree-sitter
- **Python 3** with `pynvim`
- **ripgrep** & **fd** – used by Telescope
- **C compiler** – for building Treesitter parsers

---

## 🐧 Installation (Linux)

```bash
# 1. Install prerequisites
sudo apt update
sudo apt install -y neovim git ripgrep fd-find build-essential python3-pip
sudo ln -s $(which fdfind) /usr/local/bin/fd

# 2. Install pynvim
python3 -m pip install --user --upgrade pynvim

# 3. (Optional) Install Node.js via Volta
curl https://get.volta.sh | bash
volta install node

# 4. Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true

# 5. Install this config
git clone git@github.com:23dal3/neovim_configuration.git ~/.config/nvim

# 6. Launch Neovim
nvim
```

Lazy.nvim will bootstrap and install all plugins automatically on first launch.  
Restart Neovim once installation completes.

---

## 🍏 Installation (macOS)

```bash
# 1. Install prerequisites
brew install neovim git ripgrep fd python

# 2. Install pynvim
python3 -m pip install --user --upgrade pynvim

# 3. Install Node.js via Volta (recommended)
curl https://get.volta.sh | bash
volta install node

# 4. Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true

# 5. Install this config
git clone git@github.com:23dal3/neovim_configuration.git ~/.config/nvim

# 6. Launch Neovim
nvim
```

---

## 🎨 Plugins

This setup includes:

- **Plugin Manager:** Lazy.nvim
- **Fuzzy Finder:** telescope.nvim
- **Syntax & Parsing:** nvim-treesitter
- **LSP & Autocompletion:** nvim-lspconfig, mason.nvim, nvim-cmp, LuaSnip
- **UI Enhancements:** vim-airline, themes, undotree, hover.nvim
- **Git:** vim-fugitive
- **Utilities:** vim-easy-align, vim-wakatime, none-ls.nvim
- **LaTeX:** vimtex

---

## 🧩 LSP Setup

Open Mason UI:

```vim
:Mason
```

Install servers as needed:
- lua-language-server (Lua)
- pyright (Python)
- tsserver (JavaScript/TypeScript)
- clangd (C/C++)
- texlab (LaTeX)

---

## 🎨 Recommended Extras

- **Nerd Font** → [Download here](https://www.nerdfonts.com/) and set as terminal font  
- **fzf** and **bat** for better fuzzy finding and previews:
  ```bash
  brew install fzf bat   # macOS
  sudo apt install fzf bat -y  # Linux
  ```

---

## ✅ Health Check

Run inside Neovim to verify:
```vim
:checkhealth
```

---

## 🐛 Troubleshooting

- Sync plugins manually:
  ```vim
  :Lazy sync
  ```
- Reinstall broken LSP servers:
  ```vim
  :Mason
  ```
- Fix Python issues:
  ```bash
  python3 -m pip install --user --upgrade pynvim
  ```

---

## 📜 License

MIT – use and adapt freely.
