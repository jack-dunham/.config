local M = {}

local tele = require("telescope")
-- tele.load_extension('project')
-- require'telescope'.extensions.project.project{ display_type = 'full' }

-- tele.load_extension("project")
-- tele.load_extension("file_browser")
-- tele.load_extension("bibtex")

tele.setup({
	extensions = {
		project = {
			base_dirs = {
				{ path = "~/.config/nvim" },
			},
		},
		bibtex = {
			global_files = { "~/bib/library-bibtex.bib" },
		},
		display_type = "full",
	},
})

function M.code_actions()
  local opts = {
    winblend = 15,
    layout_config = {
      prompt_position = "top",
      width = 80,
      height = 12,
    },
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    border = {},
    previewer = false,
    shorten_path = false,
  }
  local lsp = require "telescope.builtin.lsp"
  local themes = require "telescope.themes"
  lsp.code_actions(themes.get_dropdown(opts))
end

return M
