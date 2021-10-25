require'lspconfig'.julials.setup{}

-- local util = require "lspconfig/util"

-- local cmd = {
--     "julia",
--     "--startup-file=no",
--     "--history-file=no",
--     "/Users/JackDunham/.config/nvim/lsp-julia/run.jl"
-- }
-- require'lspconfig'.julials.setup{
--     	cmd = cmd,
--     	on_new_config = function(new_config, root_dir)
--         	new_config.cmd = cmd
--           	new_config.cmd_cwd = root_dir
--     	end,
--     	filetypes = {"julia"}
-- }
