local wk = require('which-key')

wk.register({
	o = {
		name = "open",
		t = {"<cmd>CHADopen<cr>", "Open/close file tree"}
	},
	["-"] = {"<cmd>CHADopen --always-focus<cr>", "Focus file tree"}
}, {prefix = "<leader>"})

