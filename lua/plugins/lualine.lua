local lualine = require("lualine")
local components = require("plugins.lualine.components")

local function signature_source()
	if not pcall(require, "lsp_signature") then
		return
	end
	local sig = require("lsp_signature").status_line(80)
	return sig
end

local function current_signature()
	local sig = signature_source()
	if sig == nil or sig.label == nil or sig.range == nil then
		return ""
	end
	local label1, label2 = "", ""
	if sig.range.start and sig.range["end"] then
		label1 = sig.label:sub(1, sig.range["start"] - 1)
		label2 = sig.label:sub(sig.range["end"] + 1, #sig.label)
	end
	local rv = label1 .. "%#DiffAdd#" .. sig.hint .. "%#Normal#" .. label2
	return rv
end

local scrollbar = {
	function()
		local current_line = vim.fn.line(".")
		local total_lines = vim.fn.line("$")
		local chars = { "  ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
		local line_ratio = current_line / total_lines
		local index = math.ceil(line_ratio * #chars)
		return chars[index]
	end,
	padding = { left = 1, right = 1 },
	-- color = { fg = colors.yellow, bg = colors.bg },
	-- separator = { left = '', right = ''},
	cond = nil,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "my dir" },
		-- lualine_c = { "filename" },
		lualine_c = { components.diff },
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
			components.treesitter,
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
		-- lualine_z = { scrollbar },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fugitive" },
	winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { components.diff },
		lualine_y = {},
		lualine_z = {},
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
})
