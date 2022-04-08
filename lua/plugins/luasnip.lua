local luasnip = require("luasnip")

--luasnip.config.setup({
--	history = true,
--	updatevents = { "TextChanged", "TextChangedI" },
--})

--function _G.snippets_clear()
--	for m, _ in pairs(luasnip.snippets) do
--		package.loaded["snippets." .. m] = nil
--	end
--	luasnip.snippets = setmetatable({}, {
--		__index = function(t, k)
--			local ok, m = pcall(require, "snippets." .. k)
--			print(m)
--			if not ok and not string.match(m, "module.*not found:") then
--				error(m)
--			end
--			t[k] = ok and m or {}

--			-- optionally load snippets from vscode- or snipmate-library:
--			--
--			-- require("luasnip.loaders.from_vscode").load({include={k}})
--			-- require("luasnip.loaders.from_snipmate").load({include={k}})
--			return t[k]
--		end,
--	})
--end

--_G.snippets_clear()

--vim.cmd([[
--augroup snippets_clear
--au!
--au BufWritePost ~/.config/nvim/lua/snippets/*.lua lua _G.snippets_clear()
--augroup END
--]])

--function _G.edit_ft()
--	-- returns table like {"lua", "all"}
--	local fts = require("luasnip.util.util").get_snippet_filetypes()
--	vim.ui.select(fts, {
--		prompt = "Select which filetype to edit:",
--	}, function(item, idx)
--		-- selection aborted -> idx == nil
--		if idx then
--			vim.cmd("edit ~/.config/nvim/lua/snippets/" .. item .. ".lua")
--		end
--	end)
--end

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

_G.tab_complete = function()
	if luasnip and luasnip.expand_or_jumpable() then
		return t("<Plug>luasnip-expand-or-jump")
	else check_back_space()
		return t("<C-k>")
	end
	return ""
end
_G.s_tab_complete = function()
	if luasnip and luasnip.jumpable(-1) then
		return t("<Plug>luasnip-jump-prev")
	else
		return t("<C-j>")
	end
	return ""
end


require("luasnip.loaders.from_lua").load({paths="./lua/luasnippets"})

vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-l>", "<Plug>luasnip-next-choice", {})
