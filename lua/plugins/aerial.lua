require("aerial").setup({
	backends = {
		julia = {"treesitter"},
	},
	filter_kind = {
		"Class",
		"Constructor",
		"Enum",
		"Function",
		"Interface",
		"Module",
		"Method",
		"Struct",
		"Constant",
	},
	min_width = 30,
	icons  = require("ui").kind_icons
})
