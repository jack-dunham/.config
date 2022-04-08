require("sidebar-nvim").setup({
	sections = { "datetime", "files", "buffers" },
    -- files = {
    --     icon = "",
    --     show_hidden = false,
    --     ignored_paths = {"%.git$"}
    -- },
    -- buffers = {
    --     icon = "",
    --     ignored_buffers = {}, -- ignore buffers by regex
    --     sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
    --     show_numbers = true, -- whether to also show the buffer numbers
    -- }
})
