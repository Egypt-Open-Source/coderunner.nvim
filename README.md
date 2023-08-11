# CodeRunner.nvim
A simple plugin to directly run code in neovim

## Installation

[lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
"Coptan99/CodeRunner.nvim"
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use "Coptan99/CodeRunner.nvim"
```

[vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug "Coptan99/CodeRunner.nvim"
```

## Supported files

1. c
2. cpp
3. python

## Usage

While opening the code file
```lua
:lua require("coderunner").runner()
```

## Keymapping

Go to your .config/nvim and paste this

```lua
vim.keymap.set("n", "<leader>qq", ":lua require('runner').runner()")
```
> Configure this for your needs

## Contribution

Feel free to do PR with new ideas as I am still a noob :)

