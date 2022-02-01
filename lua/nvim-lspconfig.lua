local border = "rounded"
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require("lsp/sumneko_lua")
require("lsp/julials")
require("lsp/texlab")

require("lspconfig").tailwindcss.setup({})

vim.lsp.set_log_level("debug")
