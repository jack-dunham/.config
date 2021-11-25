require("null-ls").config({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.completion.spell,
	},
})

require("lspconfig")["null-ls"].setup({})
