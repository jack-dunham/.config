------------------
-- LOAD PLUGINS --
------------------

require("impatient").enable_profile()

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_boostrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- local use = require('packer').use

require("packer").startup({
	function(use)
		-- Packer manages itself
		use("wbthomason/packer.nvim")
		-- Plenary
		use("lewis6991/impatient.nvim")
		use("nvim-lua/plenary.nvim")
		use({
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			config = function()
				require("plugins._telescope")
			end,
		})
		--use {'nvim-telescope/telescope-project.nvim',
		--	requires = "nvim-telescope/telescope.nvim",
		--	after = "nvim-telescope/telescope.nvim",
		--	cmd = 'Telescope projects',
		--}
		-- Magit-like interface for git
		use("tpope/vim-fugitive")
		use("tpope/vim-rhubarb")
		--
		use({
			"goolord/alpha-nvim",
			config = function()
				require("alpha").setup(require("alpha.themes.dashboard").opts)
			end,
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("lsp.null-ls")
			end,
		})
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("nvim-lspconfig")
			end,
		})
		use("tpope/vim-surround")
		-- Block comments with 'gc'
		use("tpope/vim-commentary")
		-- Theme
		--
		-- use({
		-- 	"navarasu/onedark.nvim",
		-- 	config = function()
		-- 		require("plugins.onedark")
		-- 	end,
		-- })
		use("folke/tokyonight.nvim")
		-- Status line
		use({
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("plugins._lualine")
			end,
		})
		use("lervag/vimtex")
		--
		-- Completion et al.
		use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })
		use({ "L3MON4D3/LuaSnip", wants = "friendly-snippets" })
		use({
			"hrsh7th/nvim-cmp",
			after = "LuaSnip",
			config = function()
				require("plugins._nvim-cmp")
			end,
		})
		use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })

		use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })

		use({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" })

		use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })

		use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
		--
		-- LSP
		use("williamboman/nvim-lsp-installer")
		--
		--treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
			config = function()
				require("plugins._treesitter")
			end,
		})
		-- File tree
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFocus" },
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("plugins._nvim-tree")
			end,
		})
		--
		-- Keybinds
		use({
			"folke/which-key.nvim",
			config = function()
				require("keybinds")
			end,
		})
		--
		-- use 'JuliaEditorSupport/julia-vim'
		-- use {'iamcco/markdown-preview.nvim',
		-- 	ft = 'markdown'
		-- }
		use("echasnovski/mini.nvim")
		use({ "ggandor/lightspeed.nvim", event = "BufRead" })
		use({
			"akinsho/toggleterm.nvim",
			config = function()
				require("plugins._toggleterm")
			end,
		})
		use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		--Bootstrap packer
		if packer_boostrap then
			require("packer").sync()
		end
	end,
	config = {
		-- Move to lua dir so impatient.nvim can cache it
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})
require("packer_compiled")
-------------
-- CONFIGS --
-------------
vim.g.tokyonight_style = "night"
vim.cmd([[colorscheme tokyonight]])

require("settings")

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

--config = function()
--	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--	require('lspconfig')['sumneko_lua'].setup {
--		capabilities = capabilities
--	}
--	require('lspconfig')['julials'].setup {
--		capabilities = capabilities
--	}
--	require('lspconfig')['texlab'].setup {
--		capabilities = capabilities
