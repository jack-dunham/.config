-- non nvim-tree specific settings
-- local sidebar = require('sidebar-nvim')
-- local tree = require('nvim-tree')

local M = {}



-- local tree_ok = false -- is either nvimtree or sidebar open?

-- M._tree_boot = function()
-- 	-- require("bufferline.state").set_offset(31, "File Explorer")
-- 	vim.cmd("NvimTreeFindFile") -- Packer loads nvim-tree on :NvimTreeOpen

-- 	tree_ok = true
-- 	local view = require("nvim-tree.view")
-- 	return view
-- end

-- M.toggle_tree = function()
-- 	if not tree_ok then
-- 		view = M._tree_boot()
-- 	elseif view.is_visible() then
-- 		tree.toggle()
-- 		-- require("bufferline.state").set_offset(0)
-- 	else
-- 		-- require("bufferline.state").set_offset(31, "File Explorer")
-- 		tree.find_file(true)
-- 		M._tree_boot()
-- 	end
-- end

-- M.focus_tree = function()
-- 	if not tree_ok then
-- 		view = M._tree_boot()
-- 	else
-- 		tree.focus()
-- 	end
-- end

-- return M
--
--
--

M.toggle_tree = function ()
	vim.cmd("SidebarNvimClose")
	vim.cmd("NvimTreeToggle")
end

M.toggle_sidebar = function ()
	vim.cmd("NvimTreeClose")
	vim.cmd("SidebarNvimToggle")
end

M.focus_tree = function()
	if require('nvim-tree.view').is_visible() then
		vim.cmd("NvimTreeFindFile")
	elseif require('sidebar-nvim').is_open() then
		vim.cmd("SidebarNvimFocus")
	else
		vim.cmd("NvimTreeFindFile")
	end
end

return M
