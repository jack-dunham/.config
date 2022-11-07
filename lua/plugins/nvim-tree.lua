require("nvim-tree").setup({
	update_cwd = true,
	-- update_focused_file = {
	--   enable = true,
	--   update_cwd = true
	-- },
	view = {
		width = 35,
		mappings = {
			list = {
				{ key = "<S-Tab>", cb = ":lua require('tree').toggle_sidebar()<cr>", mode = "n"},
				{ key = "<leader>-", cb = ":wincmd p<cr>", mode = "n" },
			},
		},
		signcolumn = "yes",
	},
	renderer = {
		icons = {
			git_placement = "signcolumn",
			glyphs = {
				git ={
                  unstaged = "✗",
                  staged = "✓",
                  unmerged = "",
                  renamed = "➜",
                  untracked = "",
                  deleted = "",
                  ignored = "",
				},
			},
		},
	},
})



vim.cmd [[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]

--vim.g.nvim_tree_respect_buf_cwd = 1
