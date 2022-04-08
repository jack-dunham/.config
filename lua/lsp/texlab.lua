local util = require("lspconfig/util")
local executable = '/Applications/Skim.app/Contents/SharedSupport/displayline'
local args = {"%l", "%p", "%f"}

require("lspconfig").texlab.setup({
	root_dir = util.root_pattern(".git", "main.tex"),
	settings = {
		texlab = {
			build = {
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "lualatex",
			},
			forwardSearch = {
				executable = executable,
				args = args,
			},
		},
	},
})
