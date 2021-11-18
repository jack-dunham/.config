local util = require('lspconfig/util')

require'lspconfig'.texlab.setup{
	root_dir = util.root_pattern(".git", "main.tex");
	settings = {
		texlab = {
			auxDirectory = "./out"
		}
	}
}
