local wk = require('which-key')

wk.register({
	o = {
		name = "open",
		t = {"<cmd>NvimTreeToggle<cr>", "Open/close file tree"}
	},
	["-"] = {"<cmd>NvimTreeFocus<cr>", "(Un)focus file tree"}
}, {prefix = "<leader>"})

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

-- Telescope
wk.register({
	f = {
		name = "find",
		f = {"<cmd>Telescope find_files<cr>", "Files"},
		g = {"<cmd>Telescope live_grep<cr>", "String (live)"},
		F = {"<cmd>Telescope file_browser<cr>", "File browser"},
		b = {"<cmd>Telescope buffers<cr>", "Buffers"},
		r = {"<cmd>Telescope registers<cr>", "Registers"},
		k = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
		p = {"<cmd>lua require('telescope').extensions.project.project{display_type='full'}<cr>", "Projects"}
	}
}, {prefix = "<leader>"})
