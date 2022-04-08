local set = vim.opt

set.guifont = 'FuraMono Nerd Font Mono:h11:light'

--Indents
set.tabstop=4
set.softtabstop=4
set.shiftwidth=4


--Incremental live completion
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

--Make line numbers default
vim.wo.relativenumber = true

vim.cmd([[
set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" && &filetype != "tex" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END]])

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.cmd[[set undofile]]

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap escape to leave terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", [[<c-\><c-n>]], { noremap = true })

--Add map to enter paste mode
vim.o.pastetoggle = "<F3>"

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
	if vim.o.mouse == "a" then
		vim.cmd([[IndentBlanklineDisable]])
		vim.wo.signcolumn = "no"
		vim.o.mouse = "v"
		vim.wo.number = false
		print("Mouse disabled")
	else
		vim.cmd([[IndentBlanklineEnable]])
		vim.wo.signcolumn = "yes"
		vim.o.mouse = "a"
		vim.wo.number = true
		print("Mouse enabled")
	end
end

vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua ToggleMouse()<cr>", { noremap = true })

set.laststatus = 3
