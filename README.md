# Introduction

This is my Neovim config heavily inspired by [LunarVim](https://github.com/LunarVim/LunarVim). In fact, some files and code chunks are taken directly from that project.

This config is a work in progress. Certain things may not make sense, or may be redundant as I am still learning Lua and the file-tree structure of the `~/.config/nvim/` directory. 

# Load speed

This configuration should load fast depsite the high(ish) number of plugins. [Packer.nvim](https://github.com/wbthomason/packer.nvim) has been used to optimise load order and to lazy-load a large number of plugins. I must note that much of the load order has been inspired by the [NvChad](https://github.com/NvChad/NvChad) project, particularly with regards to [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and its associated extensions. The plugin [impatient.nvim](https://github.com/lewis6991/impatient.nvim) improves startup time greatly, and is highly recommended.

# Neat tricks 

I find it useful to be able to jump back and forth between the file tree with the same keymap `<leader>-`. I bind this keymap to the command `:NvimTreeFocus` (for focusing the tree when outside the tree buffer) and then add the following into `require("nvim-tree").setup({})` (alongside all my other configuation):
```lua
require("nvim-tree").setup({
	(...)
	view = {
		mappings = {
			list = {
				{ key = "<leader>-", cb = ":wincmd p<cr>", mode = "n" },
			},
		},
	},
})
```
The command to be executed is `:wincmd p<cr>` which basically just takes you back to the previous buffer.
