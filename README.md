# Introduction

This is Neovim config heavily inspired by [LunarVim](https://github.com/LunarVim/LunarVim). In fact, some files and code chunks are taken directly from that project.

This config is a work in progress. Certain things may not make sense, or may be redundant as I am still learning Lua and the file-tree structure of the `~/.config/nvim/` directory. 

# Load speed

This configuration should load fast depsite the high(ish) number of plugins. [Packer](https://github.com/wbthomason/packer.nvim) has been used to optimise load order and to lazy-load a large number of plugins. I must note that much of the load order has been inspired by the [NvChad](https://github.com/NvChad/NvChad) project, particularly with regards to [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and its associated extensions. The plugin [impatient.nvim](https://github.com/lewis6991/impatient.nvim) improves startup time greatly, and is highly recommended.
