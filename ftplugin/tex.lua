local wk = require('which-key')


vim.wo.cursorline = false
vim.wo.rnu = false


wk.register({
	c = {"<cmd>TexlabBuild<cr>", "Compile"},
	v = {"<cmd>TexlabForward<cr>", "View"},
},{mode = "n",prefix="<LocalLeader>", buffer=0})
