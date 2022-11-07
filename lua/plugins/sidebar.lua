-- vim.api.nvim_set_hl(0, "SidebarNvimNormal", {link="NormalSB"})
-- vim.api.nvim_set_hl(0, "SidebarNvimNormal", {link="SignColumnSB"})

require("sidebar-nvim").setup({
	sections = {"git", "buffers"},
    files = {
        icon = "",
        show_hidden = true,
        ignored_paths = {"%.git$"}
    },
	bindings = {
		["<S-Tab>"] = function() require('tree').toggle_tree() end ,
		["<leader>-"] = function() vim.cmd("wincmd p") end,
	}
    -- buffers = {
    --     icon = "",
    --     ignored_buffers = {}, -- ignore buffers by regex
    --     sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
    --     show_numbers = true, -- whether to also show the buffer numbers
    -- }
})

-- vim.api.nvim_set_hl(0, 'SidebarNvimNormal', 'NvimTreeNormal')
