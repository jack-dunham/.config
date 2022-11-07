local winbar = {}

local colors = require("catppuccin.palettes").get_palette()
local icons = require("nvim-web-devicons")

-- vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = colors.blue, bg = colors.crust })
vim.api.nvim_set_hl(0, "WinBar", { fg = colors.blue, bg = colors.base, bold = true })
vim.api.nvim_set_hl(0, "WinBarNC", {fg = colors.surface2, bg = colors.base})
vim.api.nvim_set_hl(0, "WinBarNF", {fg = colors.mantle, bg=colors.mantle})
-- local function get_activity(number)
-- 	if vim.api.nvim_get_current_buf() == number then
-- 		return 2
-- 	end
-- 	if vim.fn.bufwinnr(number) ~= -1 then
-- 		return 1
-- 	end
-- 	return 0
-- end

winbar.eval = function()
	local icon = icons.get_icon_by_filetype(vim.bo.filetype)
	if icon == nil then
		icon = " "
	end

	local fileraw = vim.api.nvim_eval_statusline("%f", {})["str"]
	if fileraw == "[No Name]" then
		return ""
	end
	-- if string.find(fileraw, "NvimTree") or string.find(fileraw, "Sidebar") then
	-- 	return  "%#WinBarFT#"..string.rep(" ",vim.fn.winwidth(0)).."%*"
	-- end
	if vim.bo.buftype == "nofile" then
		return  "%#WinBarNF#"..string.rep(" ",vim.fn.winwidth(0)).."%*"
	end
	local lenf = #fileraw
	local padlen = vim.fn.winwidth(0) - lenf - 7
	local padding = string.rep(" ", padlen)
	local winstr = -- "%#WinBarSeparator#"
	" "
		 -- " "
		.. vim.api.nvim_win_get_number(0)
		.. " "
		.. icon
		.. " "
		.. fileraw
		.. padding
		-- .. ""
		.. " "
	return winstr
end

return winbar
		-- .. "%*"
		-- .. "%#WinBarEnd#"
