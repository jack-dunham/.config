local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local nvim_web_devicons = require("nvim-web-devicons")
local cdir = vim.fn.getcwd()

local path_ok, path = pcall(require, "plenary.path")

if not path_ok then
	return
end

local function get_footer()
	local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
	local datetime = os.date("  %m-%d-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
	return datetime .. "   Plugins " .. plugins_count .. nvim_version_info
end

local footer = {
	type = "text",
	val = get_footer(),
	opts = {
		position = "center",
		hl = "Number",
	},
}

local function get_extension(fn)
	local match = fn:match("^.+(%..+)$")
	local ext = ""
	if match ~= nil then
		ext = match:sub(2)
	end
	return ext
end

local function icon(fn)
	local nwd = require("nvim-web-devicons")
	local ext = get_extension(fn)
	return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn)
	short_fn = short_fn or fn
	local ico_txt
	local fb_hl = {}

	local ico, hl = icon(fn)
	local hl_option_type = type(nvim_web_devicons.highlight)
	if hl_option_type == "boolean" then
		if hl and nvim_web_devicons.highlight then
			table.insert(fb_hl, { hl, 0, 1 })
		end
	end
	if hl_option_type == "string" then
		table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 1 })
	end
	ico_txt = ico .. "  "

	local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
	local fn_start = short_fn:match(".*/")
	if fn_start ~= nil then
		table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt - 2 })
	end
	file_button_el.opts.hl = fb_hl
	return file_button_el
end

local default_mru_ignore = { "gitcommit" }

local mru_opts = {
	ignore = function(path, ext)
		return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
	end,
}

--- @param start number
--- @param cwd string optional
--- @param items_number number optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
	opts = opts or mru_opts
	items_number = items_number or 9

	local oldfiles = {}
	for _, v in pairs(vim.v.oldfiles) do
		if #oldfiles == items_number then
			break
		end
		local cwd_cond
		if not cwd then
			cwd_cond = true
		else
			cwd_cond = vim.startswith(v, cwd)
		end
		local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
		if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
			oldfiles[#oldfiles + 1] = v
		end
	end

	-- local special_shortcuts = { "a", "s", "d" }
	local target_width = 35

	local tbl = {}
	for i, fn in ipairs(oldfiles) do
		local short_fn
		if cwd then
			short_fn = vim.fn.fnamemodify(fn, ":.")
		else
			short_fn = vim.fn.fnamemodify(fn, ":~")
		end

		if #short_fn > target_width then
			short_fn = path.new(short_fn):shorten(1, { -2, -1 })
			if #short_fn > target_width then
				short_fn = path.new(short_fn):shorten(1, { -1 })
			end
		end

		local shortcut = ""
		-- if i <= #special_shortcuts then
		-- 	shortcut = special_shortcuts[i]
		-- else
		-- 	shortcut = tostring(i + start - 1 - #special_shortcuts)
		-- end

		shortcut = tostring(i + start - 1)
		local file_button_el = file_button(fn, " " .. shortcut, short_fn)
		tbl[i] = file_button_el
	end
	return {
		type = "group",
		val = tbl,
		opts = {},
	}
end

local section_mru = {
	type = "group",
	val = {
		{
			type = "text",
			val = "Recent",
			opts = {
				hl = "Type",
				shrink_margin = false,
				position = "center",
			},
		},
		{ type = "padding", val = 1 },
		{
			type = "group",
			val = function()
				return { mru(1, cdir, 9) }
			end,
			opts = { shrink_margin = false },
		},
	},
}

local buttons_edit = {
	type = "group",
	val = {
		{ type = "text", val = "Edit", opts = { hl = "Type", position = "center" } },
		{ type = "padding", val = 1 },
		dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
		dashboard.button(
			"f",
			"  Find File",
			"<cmd>Telescope find_files<CR>"
		),
		-- dashboard.button("SPC e n", "   New File", ":ene <BAR> startinsert <CR>"),
		dashboard.button(
			"p",
			"  Find Project",
			"<cmd>lua require('telescope').extensions.project.project{display_type='full'}<cr>"
		),
		-- dashboard.button("h", "  Recent Files", ":Telescope oldfiles <CR>"),
		dashboard.button("h", "祥 Recent Files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", "  Find Text", ":Telescope live_grep <CR>"),
	},
	opts = { position = "center" },
}

local buttons_other = {
	type = "group",
	val = {
		{ type = "text", val = "Other", opts = { hl = "Type", position = "center" } },
		{ type = "padding", val = 1 },
		dashboard.button("g", "  Git Status", ":Neogit <CR>"),
		-- dashboard.button("g", "  Find Text", ":Telescope live_grep <CR>"),
		dashboard.button("s", "  Sync Plugins", ":PackerSync <CR>"),
		dashboard.button("u", "ﰶ  Update Plugins", ":PackerUpdate <CR>"),
		-- dashboard.button("SPC i p", "   Add/Remove Plugins", ":e ~/.config/nvim/lua/core/plugins.lua<CR>"),
		dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
		dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	},
	opts = { position = "center" },
}
dashboard.section.buttons.val = {
	dashboard.button(
		"SPC f F",
		"  File Browser",
		"<cmd>lua require('telescope').extensions.file_browser.file_browser{}<CR>"
	),
	-- dashboard.button("SPC e n", "   New File", ":ene <BAR> startinsert <CR>"),
	dashboard.button(
		"SPC f p",
		"  Find Project",
		"<cmd>lua require('telescope').extensions.project.project{display_type='full'}<cr>"
	),
	dashboard.button("SPC f h", "  Recent Files", ":Telescope oldfiles <CR>"),
	dashboard.button("SPC f g", "  Find Text", ":Telescope live_grep <CR>"),
	dashboard.button("SPC p s", "  Sync Plugins", ":PackerSync <CR>"),
	-- dashboard.button("SPC i p", "   Add/Remove Plugins", ":e ~/.config/nvim/lua/core/plugins.lua<CR>"),
	dashboard.button("SPC c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button(":q", "  Quit Neovim", ":qa<CR>"),
}

local opts = {
	layout = {
		dashboard.section.header,
		{ type = "padding", val = 2 },
		section_mru,
		{ type = "padding", val = 2 },
		buttons_edit,
		{ type = "padding", val = 2 },
		buttons_other,
		{ type = "padding", val = 1 },
		footer,
	},
	opts = {
		margin = 5,
	},
}

-- dashboard.section.footer.val = footer()

vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(opts)
