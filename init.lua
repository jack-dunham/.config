------------------
-- LOAD PLUGINS --
------------------

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

require("impatient").enable_profile()
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
				require("plugins.telescope")
			end,
		})
		--use {'nvim-telescope/telescope-project.nvim',
		--	requires = "nvim-telescope/telescope.nvim",
		--	after = "nvim-telescope/telescope.nvim",
		--	cmd = 'Telescope projects',
		--}
		-- Magit-like interface for git
		-- use("tpope/vim-fugitive")
		use({
			"TimUntersberger/neogit",
			cmd = { "Neogit", "Neogit commit" },
			requires = "nvim-lua/plenary.nvim",
		})
		use({
			"lewis6991/gitsigns.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})
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
		use({
			"catppuccin/nvim",
			as = "catppuccin",
			config = function()
				require("plugins.catppuccin")
			end,
		})
		--
		-- Status line
		use({
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("plugins.lualine")
			end,
		})
		-- use("lervag/vimtex")
		--
		-- Completion et al.
		use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })
		use({ "L3MON4D3/LuaSnip", wants = "friendly-snippets" })
		use({
			"hrsh7th/nvim-cmp",
			after = "LuaSnip",
			config = function()
				require("plugins.nvim-cmp")
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
				require("plugins.treesitter")
			end,
		})
		-- File tree
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = { "NvimTreeFindFile", "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFocus" },
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("plugins.nvim-tree")
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
		use({ "ggandor/lightspeed.nvim", event = "BufRead" })
		use({
			"akinsho/toggleterm.nvim",
			config = function()
				require("plugins.toggleterm")
			end,
		})
		use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use({
			"nvim-neorg/neorg",
			after = "nvim-treesitter",
			config = function()
				require("plugins.neorg")
			end,
		})
		use({
			"vimwiki/vimwiki",
			config = function()
				vim.g.vimwiki_list = {
					{ path = "~/Projects/Personal/website/MyNotes", syntax = "markdown", ext = ".md" },
				}
			end,
		})
		-- use({
		-- 	"nvim-orgmode/orgmode",
		-- 	config = function()
		-- 		require("plugins._orgmode")
		-- 	end
		-- })
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
-- vim.g.tokyonight_style = "night"
vim.cmd([[colorscheme catppuccin]]) -- Finally, a good fucking theme.

require("settings")
