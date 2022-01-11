require("nvim-tree").setup({
	update_cwd = true,
	-- update_focused_file = {
	--   enable = true,
	--   update_cwd = true
	-- },
	auto_close = true,
	view = {
		mappings = {
			list = {
				{ key = "<leader>-", cb = ":wincmd p<cr>", mode = "n" },
			},
		},
	},
})


--vim.g.nvim_tree_respect_buf_cwd = 1
