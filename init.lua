------------------
-- LOAD PLUGINS --
------------------

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_boostrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- local use = require('packer').use

require('packer').startup(function(use)
	-- Packer manages itself
	use 'wbthomason/packer.nvim'
	-- Plenary
	use 'nvim-lua/plenary.nvim'
	-- Magit-like interface for git
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	-- Block comments with 'gc'
	use 'tpope/vim-commentary'
	-- Theme
	use {'navarasu/onedark.nvim',
		config = function()
			require('plugins/onedark')
		end
	}
	-- Status line
	use {'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('plugins/lualine')
		end
	}
	use 'lervag/vimtex'
	use 'L3MON4D3/LuaSnip'
	-- Completion engine
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
	-- lsp
	use 'williamboman/nvim-lsp-installer'
	use {'neovim/nvim-lspconfig',
		config = function() require('nvim-lspconfig') end
	}
	use 'onsails/lspkind-nvim'
	use 'nvim-treesitter/nvim-treesitter'
	-- File tree
	use {'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require'nvim-tree'.setup {} end
	}
	use {'folke/which-key.nvim',
		config = function() require('keybinds') end
	}
	use 'JuliaEditorSupport/julia-vim'
	use 'axvr/zepl.vim'
	--Bootstrap packer
	if packer_boostrap then
		require('packer').sync()
	end
end)
-------------
-- CONFIGS --
-------------

require('settings')

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"julia", "lua", "latex"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting= false,
  },
}
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference ="",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
      		expand = function(args)
        		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      		end,
    	},
    	mapping = {
      		['<C-d>'] = cmp.mapping.scroll_docs(-4),
      		['<C-f>'] = cmp.mapping.scroll_docs(4),
      		['<C-Space>'] = cmp.mapping.complete(),
      		['<C-e>'] = cmp.mapping.close(),
      		['<CR>'] = cmp.mapping.confirm({ select = true }),
    	},
    	sources = cmp.config.sources({
      		{ name = 'nvim_lsp' },
      		{ name = 'luasnip' }, -- For luasnip users.
    	}, {
      		{ name = 'buffer' },
    	})
})

  -- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['sumneko_lua'].setup {
    	capabilities = capabilities
}
require('lspconfig')['julials'].setup {
    	capabilities = capabilities
}

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  }
}



--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap escape to leave terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<c-\><c-n>]], {noremap = true})

--Add map to enter paste mode
vim.o.pastetoggle="<F3>"


-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == 'a' then
    vim.cmd[[IndentBlanklineDisable]]
    vim.wo.signcolumn='no'
    vim.o.mouse = 'v'
    vim.wo.number = false
    print("Mouse disabled")
  else
    vim.cmd[[IndentBlanklineEnable]]
    vim.wo.signcolumn='yes'
    vim.o.mouse = 'a'
    vim.wo.number = true
    print("Mouse enabled")
  end
end

vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true })
