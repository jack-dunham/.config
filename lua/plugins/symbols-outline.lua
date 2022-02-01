local M = {}
local ui = require("ui")
-- local config = require("symbols-outline.config")
-- local options = config.defaults

function M.icon_config()
	local symbols = {
		File = { icon = "", hl = "TSURI" },
		Module = { icon = "", hl = "TSNamespace" },
		Namespace = { icon = "", hl = "TSNamespace" },
		Package = { icon = "", hl = "TSNamespace" },
		Class = { icon = "𝓒", hl = "TSType" },
		Method = { icon = "ƒ", hl = "TSMethod" },
		Property = { icon = "", hl = "TSProperty"},
		Field = { icon = "", hl = "TSField" },
		Constructor = { icon = "", hl = "TSConstructor" },
		Enum = { icon = "ℰ", hl = "TSType" },
		Interface = { icon = "ﰮ", hl = "TSType" },
		Function = { icon = "", hl = "TSFunction" },
		Variable = { icon = "", hl = "TSConstant" },
		Constant = { icon = "", hl = "TSConstant" },
		String = { icon = "", hl = "TSString" },
		Number = { icon = "#", hl = "TSNumber" },
		Boolean = { icon = "⊨", hl = "TSBoolean" },
		Array = { icon = "", hl = "TSConstant" },
		Object = { icon = "⦿", hl = "TSType" },
		Key = { icon = "", hl = "TSType" },
		Null = { icon = "NULL", hl = "TSType" },
		EnumMember = { icon = "", hl = "TSField" },
		Struct = { icon = "𝓢", hl = "TSType" },
		Event = { icon = "🗲", hl = "TSType" },
		Operator = { icon = "+", hl = "TSOperator" },
		TypeParameter = { icon = "𝙏", hl = "TSParameter" },
	}

	for kind, _ in pairs(symbols) do
		symbols[kind]["icon"] = ui.kind_icons[kind]
	end
	return symbols
end

function M.setup()
	vim.g.symbols_outline = {
		width = 50,
		symbols = M.icon_config(),
	}
end

return M
