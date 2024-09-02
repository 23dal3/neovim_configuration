# neovim_configuration
My NeoVim Configuration

## Linux Installation
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```

```bash
export PATH="$PATH:/opt/nvim-linux64/bin"
```

Then run 
```bash
mkdir ~/.config/nvim/
nvim ~/.config/nvim/init.vim
```
## Download `Vim-Plug`
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Needed Linters
```bash
:MasonInstall ruff
:MasonInstall black
:MasonInstall pylinter
```
## Needed Python Packages
```bash
pip install pynvim
```

