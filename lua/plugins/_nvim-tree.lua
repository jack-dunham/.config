require("nvim-tree").setup({
	update_cwd = true,
	-- update_focused_file = {
	--   enable = true,
	--   update_cwd = true
	-- },
	view = {
		mappings = {
			list = {
				{ key = "<leader>-", cb = ":wincmd p<cr>", mode = "n" },
			},
		},
	},
})
local view = require("nvim-tree.view")

local _M = {}
_M.toggle_tree = function()
	if view.win_open() then
		require("nvim-tree").close()
		require("bufferline.state").set_offset(0)
	else
		require("bufferline.state").set_offset(31, "File Explorer")
		require("nvim-tree").find_file(true)
	end
end

_M.focus_tree = function()
	if view.win_open() then
		require("nvim-tree").focus()
	else
		_M.toggle_tree()
	end
end

return _M
--vim.g.nvim_tree_respect_buf_cwd = 1
