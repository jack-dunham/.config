local wk = require('which-key')

-- -- LSP setup. 
-- require'lspconfig'.julials.setup{
--     on_new_config = function(new_config, _)
--         local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
--         if require'lspconfig'.util.path.is_file(julia) then
--             new_config.cmd[1] = julia
--         end
--     end
-- }
-- Terminal commands

vim.bo.expandtab = true
vim.bo.textwidth=92
vim.wo.colorcolumn="+1"


wk.register({
	j = {
		name = 'Julia',
		o = {"<cmd>lua _julia_toggle()<cr>", "Open Julia REPL" },
		i = {"<cmd>lua _julia_include()<cr>", "Include current file in REPL" },
		t = {"<cmd>lua _julia_test()<cr>", "Run the test suite" },
	}
},{prefix="<leader>", buffer=0})
