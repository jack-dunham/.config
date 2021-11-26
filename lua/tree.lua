-- non nvim-tree specific settings
local M = {}

local tree_ok = false

M._tree_boot = function()
	require("bufferline.state").set_offset(31, "File Explorer")
	vim.cmd("NvimTreeFindFile") -- Packer loads nvim-tree on :NvimTreeOpen

	tree_ok = true
	local view = require("nvim-tree.view")
	return view
end

M.toggle_tree = function()
	if not tree_ok then
		view = M._tree_boot()
	elseif view.win_open() then
		require("nvim-tree").close()
		require("bufferline.state").set_offset(0)
	else
		require("bufferline.state").set_offset(31, "File Explorer")
		require("nvim-tree").find_file(true)
		M._tree_boot()
	end
end

M.focus_tree = function()

	if not tree_ok then
		view = M._tree_boot()
	else
		require("nvim-tree").focus()
	end
end

return M
