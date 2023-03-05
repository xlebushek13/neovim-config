# Kitsune Neovim Config

## Instalation

- clone this repo to ~/.config/nvim
- after clone use PackerInstall dont worry about errors on first start neovim
- change the undo dir in lua/base.lua for your username
- change the path to xkb-switch lib by yuor system (in example used base linux path)

## Architecture

- plugin options in after/plugin.
- keybindings in lua/maps.lua
- all plugins in lua/plugins.lua

## TODO: 

- DONE: rebase from init.vim to init.lua
- DONE: rebase from Vim PLug to packer
- DONE: struct better settings.lua and vim.cmd options
- remap keybindings from vim.cmd() style to nvim.lua style
