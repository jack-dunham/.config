local wk = require("which-key")

wk.setup({
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
	},
})

wk.register({
	e = { "<cmd>lua require('tree').toggle_tree()<cr>", "Toggle file explorer" },
	["-"] = { "<cmd>lua require('tree').focus_tree()<cr>", "(Un)focus file explorer" },
}, { prefix = "<leader>" })

wk.register({
	p = {
		name = "packer",
		i = { "<cmd>PackerInstall<cr>", "Install" },
		S = { "<cmd>PackerSource<cr>", "Source" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		p = { "<cmd>PackerProfile<cr>", "Profile" },
		t = { "<cmd>PackerStatus<cr>", "Status" },
		d = { "<cmd>PackerClean<cr>", "Clean" },
	},
}, { prefix = "<leader>" })

wk.register({
	g = {
		name = "git",
		g = { "<cmd>Git<cr>", "Status" },
	},
}, { prefix = "<leader>" })

wk.register({
	-- w = {
	-- 	name = "window",
	-- 	s = { "<cmd>split<cr>", "Split"},
	-- 	S = { "<cmd>vsplit<cr>", "Vertical split"},
	-- 	c = { "<cmd>close<cr>", "Close"},
	-- 	n = { "<cmd>new<cr>", "New"},
	-- 	N = { "<cmd>vnew<cr>", "Vertical new"},
	-- 	h = { "<cmd>hide<cr>", "Hide"},
	-- },
	f = {
		name = "find",
		f = { "<cmd>Telescope find_files<cr>", "Files" },
		g = { "<cmd>Telescope live_grep<cr>", "Word (live)" },
		F = { "<cmd>Telescope file_browser<cr>", "File browser" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		p = { "<cmd>lua require('telescope').extensions.project.project{display_type='full'}<cr>", "Projects" },
	},
	l = {
		name = "LSP",
		a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		p = {
			name = "Peek",
			d = { "<cmd>lua require('lsp.peek').Peek('definition')<cr>", "Definition" },
			t = { "<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
			i = { "<cmd>lua require('lsp.peek').Peek('implementation')<cr>", "Implementation" },
		},
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
}, { prefix = "<leader>" })


wk.register({
	["s"] = {"Search forwards"},
	["S"] = {"Search backwards"},
	["<M-,>"] = {"<cmd>BufferPrevious<cr>", "Previous"},
	["<M-.>"] = {"<cmd>BufferNext<cr>", "Next"},
	["<M-S-,>"] = {"<cmd>BufferMovePrevious<cr>", "Move previous"},
	["<M-S-.>"] = {"<cmd>BufferMoveNext<cr>", "Move next"},
	["<M-1>"] = {"<cmd>BufferGoto 1<cr>", "Buffer 1"},
	["<M-2>"] = {"<cmd>BufferGoto 2<cr>", "Buffer 2"},
	["<M-3>"] = {"<cmd>BufferGoto 3<cr>", "Buffer 3"},
	["<M-4>"] = {"<cmd>BufferGoto 4<cr>", "Buffer 4"},
	["<M-5>"] = {"<cmd>BufferGoto 5<cr>", "Buffer 5"},
	["<M-6>"] = {"<cmd>BufferGoto 6<cr>", "Buffer 6"},
	["<M-7>"] = {"<cmd>BufferGoto 7<cr>", "Buffer 7"},
	["<M-8>"] = {"<cmd>BufferGoto 8<cr>", "Buffer 8"},
	["<M-9>"] = {"<cmd>BufferGoto 9<cr>", "Buffer 9"},
	["<M-0>"] = {"<cmd>BufferLast<cr>", "Last"},
	["<M-c>"] = {"<cmd>BufferClose<cr>", "Close"},
	["<C-p>"] = {"<cmd>BufferPick<cr>", "Pick"},
	["<Space>bb"] = {"<cmd>BufferOrderByBufferNumber<cr>", "Order buffers by number"},
	["<Space>bd"] = {"<cmd>BufferOrderByDirectory<cr>", "Order buffers by directory"},
	["<Space>bl"] = {"<cmd>BufferOrderByLanguage<cr>", "Order buffers by langauge"},
}, {mode = "n", noremap = true, silent = true})

-- local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }

-- map("n", "<M-,>", ":BufferPrevious<CR>", opts)
-- map("n", "<M-.>", ":BufferNext<CR>", opts)
-- -- Re-order to previous/next
-- map("n", "<M-<>", ":BufferMovePrevious<CR>", opts)
-- map("n", "<M->>", " :BufferMoveNext<CR>", opts)
-- -- Goto buffer in position...
-- map("n", "<M-1>", ":BufferGoto 1<CR>", opts)
-- map("n", "<M-2>", ":BufferGoto 2<CR>", opts)
-- map("n", "<M-3>", ":BufferGoto 3<CR>", opts)
-- map("n", "<M-4>", ":BufferGoto 4<CR>", opts)
-- map("n", "<M-5>", ":BufferGoto 5<CR>", opts)
-- map("n", "<M-6>", ":BufferGoto 6<CR>", opts)
-- map("n", "<M-7>", ":BufferGoto 7<CR>", opts)
-- map("n", "<M-8>", ":BufferGoto 8<CR>", opts)
-- map("n", "<M-9>", ":BufferGoto 9<CR>", opts)
-- map("n", "<M-0>", ":BufferLast<CR>", opts)
-- -- Close buffer
-- map("n", "<M-c>", ":BufferClose<CR>", opts)
-- -- Wipeout buffer
-- --                 :BufferWipeout<CR>
-- -- Close commands
-- --                 :BufferCloseAllButCurrent<CR>
-- --                 :BufferCloseBuffersLeft<CR>
-- --                 :BufferCloseBuffersRight<CR>
-- -- Magic buffer-picking mode
-- map("n", "<C-p>", ":BufferPick<CR>", opts)
-- -- Sort automatically by...
-- map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", opts)
-- map("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
-- map("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)

-- -- Other:
-- -- :BarbarEnable - enables barbar (enabled by default)
-- -- :BarbarDisable - very bad command, should never be used
