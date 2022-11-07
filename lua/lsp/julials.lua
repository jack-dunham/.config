local util = require("lspconfig.util")
local cmd = {
  'julia',
  '--startup-file=no',
  '--history-file=no',
  '-e',
  [[
    # Load LanguageServer.jl: attempt to load from ~/.julia/environments/nvim-lspconfig
    # with the regular load path as a fallback
    ls_install_path = joinpath(
        get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")),
        "environments", "nvim-lspconfig"
    )
    pushfirst!(LOAD_PATH, ls_install_path)
    using LanguageServer
    popfirst!(LOAD_PATH)
    depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
    project_path = let
        dirname(something(
            ## 1. Finds an explicitly set project (JULIA_PROJECT)
            Base.load_path_expand((
                p = get(ENV, "JULIA_PROJECT", nothing);
                p === nothing ? nothing : isempty(p) ? nothing : p
            )),
            ## 2. Look for a Project.toml file in the current working directory,
            ##    or parent directories, with $HOME as an upper boundary
            Base.current_project(),
            ## 3. First entry in the load path
            get(Base.load_path(), 1, nothing),
            ## 4. Fallback to default global environment,
            ##    this is more or less unreachable
            Base.load_path_expand("@v#.#"),
        ))
    end
    @info "Running language server" VERSION pwd() project_path depot_path
    server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
    server.runlinter = false
    run(server)
  ]],
}

local function create_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.preselectSupport = true
	capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = { "documentation", "detail", "additionalTextEdits" },
	}
	capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
	capabilities.textDocument.codeAction = {
		dynamicRegistration = true,
		codeActionLiteralSupport = {
			codeActionKind = {
				valueSet = (function()
					local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
					table.sort(res)
					return res
				end)(),
			},
		},
	}
	return capabilities
end

require("lspconfig").julials.setup({
	on_new_config = function(new_config, _)
		local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
		if require("lspconfig").util.path.is_file(julia) then
			new_config.cmd[1] = julia
		end
	end,
	root_dir = function(fname)
		return util.root_pattern("Project.toml")(fname) or util.find_git_ancestor(fname)
	end,
	filetypes = { "julia" },
	capabilities = create_capabilities(),
	-- single_file_support = false,
})

-- local util = require "lspconfig/util"

-- local cmd = {
--     "julia",
--     "--startup-file=no",
--     "--history-file=no",
--     "/Users/JackDunham/.config/nvim/lsp-julia/run.jl"
-- }
-- require'lspconfig'.julials.setup{
--     	cmd = cmd,
--     	on_new_config = function(new_config, root_dir)
--         	new_config.cmd = cmd
--           	new_config.cmd_cwd = root_dir
--     	end,
--     	filetypes = {"julia"}
-- }
