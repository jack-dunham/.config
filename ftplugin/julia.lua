local wk = require('which-key')

wk.register({
	t = {
		name = 'terminal',
		o = {"<cmd>botright T julia<cr>", "Open julia REPL" },
		i = {"<cmd>Texec Revise.includet(\"%\")<cr>", "Include current file in REPL" }
	}
},{prefix="<leader>", buffer=0})
