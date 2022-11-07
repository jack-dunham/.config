require("lspconfig").ltex.setup({
	filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex"},
	settings = {
		ltex = {
			enabled = {
				{ "julia" },
			},
		},
	},
})
