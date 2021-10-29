local wk = require('which-key')

wk.register({
	o = {
		name = "open",
		t = {"<cmd>NvimTreeToggle<cr>", "Open/close file tree"}
	},
	["-"] = {"<cmd>NvimTreeFocus<cr>", "Focus file tree"}
}, {prefix = "<leader>"})

wk.register({
	["g?"] = {"Toggle help"},
	["<leader>-"] = {"<cmd>wincmd p<cr>", "Unfocus file tree"}
}, {buffer = 2})


wk.register({
	p = {
		name = "packer",
		i = {"<cmd>PackerInstall<cr>", "Install"},
		S = {"<cmd>PackerSource<cr>", "Source"},
		s = {"<cmd>PackerSync<cr>", "Sync"},
		u = {"<cmd>PackerUpdate<cr>", "Update"},
		c = {"<cmd>PackerCompile<cr>", "Compile"},
		p = {"<cmd>PackerProfile<cr>", "Profile"},
		t = {"<cmd>PackerStatus<cr>", "Status"},
		d = {"<cmd>PackerClean<cr>", "Clean"},
	}
}, {prefix = "<leader>"})

wk.register({
	g = {
		name = "git",
		g = {"<cmd>Git<cr>", "Status"},
	}
}, {prefix = "<leader>"})
