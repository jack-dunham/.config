local tt = require("toggleterm")

tt.setup{}

local Terminal = require("toggleterm.terminal").Terminal

local julia = Terminal:new({cmd = "julia --sysimage="..os.getenv("HOME").."/.julia/environments/REPL/OMR-sysimage", direction = "float", close_on_exit=true, hidden = true})

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

function _julia_test()
	julia:open()
	julia:send([[Pkg.test()]], false)
end
