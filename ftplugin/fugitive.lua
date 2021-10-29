local wk = require('which-key')

wk.register({
	["s"] = {"Stage"},
	["u"] = {"Unstage (reset)"},
	["-"] = {"Stage or unstage"},
	["U"] = {"Unstage all"},
	["X"] = {"Discard change"},
	["="] = {"Toggle inline diff"},
	[">"] = {"Insert inline diff"},
	["<"] = {"Remove inline diff"},
},{buffer=0})

wk.register({
	["g?"] = {"Keybind help"},
	["gu"] = {"Jump to file in Untracked/Unstaged"},
	["gU"] = {"Jump to file in Unstaged"},
	["gs"] = {"Jump to file in Staged"},
	["gp"] = {"Jump to file in Unpushed"},
	["gP"] = {"Jump to file in Unpulled"},
	["gr"] = {"Jump to file in Rebasing"},
	["gi"] = {"Open .git/info/exclude"}
},{buffer=0})
