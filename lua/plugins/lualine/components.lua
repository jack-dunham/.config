local conditions = require("plugins.lualine.conditions")

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

return {
	diff = {
		"diff",
		source = diff_source,
		symbols = { added = "  ", modified = " ", removed = " " },
		diff_color = {
			added = "GitSignsAdd",
			modified = "GitSignsChange",
			removed = "GitSignsDelete",
		},
		cond = nil,
	},
	treesitter = {
		function()
			local b = vim.api.nvim_get_current_buf()
			if next(vim.treesitter.highlighter.active[b]) then
				return ""
			end
			return ""
		end,
		color = "GitSignsAdd",
		cond = conditions.hide_in_width,
	},
}
