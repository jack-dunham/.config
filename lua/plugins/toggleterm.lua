local tt = require("toggleterm")
local util = require("lspconfig.util")

tt.setup{}

local Terminal = require("toggleterm.terminal").Terminal

local julia = Terminal:new({cmd = "julia --sysimage="..os.getenv("HOME").."/.julia/environments/REPL/OMR-sysimage", direction = "horizontal", close_on_exit=true, hidden = true})

-- local test_cmd = [["Pkg.test(); exit()"]]
-- local julia_test = Terminal:new({cmd = [[julia -e]]..test_cmd, direction = "float", close_on_exit = false, hidden = true })

function _julia_toggle()
   	julia:toggle()
end

function _julia_open()
   	julia:open()
end

function _julia_include()
	if vim.bo.filetype == "julia" then
		local fp = vim.fn.expand('%:p')
		julia:open()
		julia:send([[Revise.includet("]]..fp..[[")]], false)
	else
		print("Buffer is not of .jl filetype. Cannot include into Julia REPL")
	end
end

function _julia_test(item)
	print(item)
	local test_cmd = ""
	if item == nil then
		return nil
	elseif item == "all" then
		test_cmd = [[Pkg.test()]]
	else
		test_cmd = string.format("args = Vector{String}(); push!(args, \"%s\"); Pkg.test( test_args=args )",item)
	end
	local cmd = [[julia -q]]
	local julia_test = Terminal:new({cmd = cmd, direction = "float", close_on_exit = false, hidden = true })
	julia_test:open()
	julia_test:send(test_cmd, false)
	julia_test:send("exit()", false)
end

function _julia_get_tests()
    local root_dir = vim.fn.getcwd()
	local test_files = vim.fn.globpath(root_dir.."/test","*.jl",0,1)
	-- local items = {}
	-- for i,v in ipairs(test_files) do
	-- 	print(v)
	-- 	table.insert(items, test_files[i])
	-- end
	local items = {}
	local function format_test_file(item)
		item = string.gsub(item, root_dir.."/test/","")
		item = string.gsub(item, ".jl","")
		if item == "runtests" then
			return "all"
		else
			return item
		end
	end
	for _,file in ipairs(test_files) do
		table.insert(items, format_test_file(file))
	end
	vim.ui.select(items, {prompt = "Choose file:"}, _julia_test)
end

function get_workspace(fname)
	return util.root_pattern 'Project.toml'(fname) or util.find_git_ancestor(fname)
end

local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true})

function _lazygit_toggle()
  lazygit:toggle()
end
