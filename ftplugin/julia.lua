local wk = require('which-key')

-- LSP setup. 
require'lspconfig'.julials.setup{
    on_new_config = function(new_config, _)
        local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
        if require'lspconfig'.util.path.is_file(julia) then
            new_config.cmd[1] = julia
        end
    end
}
-- Terminal commands
wk.register({
	t = {
		name = 'terminal',
		o = {"<cmd>lua _julia_toggle()<cr>", "Open julia REPL" },
		i = {"<cmd>Texec Revise.includet(\"%\")<cr>", "Include current file in REPL" }
	}
},{prefix="<leader>", buffer=0})
