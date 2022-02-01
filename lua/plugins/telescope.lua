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
