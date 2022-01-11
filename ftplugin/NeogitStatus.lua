local wk = require('which-key')

wk.register({
	["$"] = {"Command history"},
	["b"] = {"Branch popup"},
	["s"] = {"Stage"},
	["S"] = {"Stage unstaged"},
	["u"] = {"Unstage"},
	["U"] = {"Unstage staged"},
	["<C-s>"] = {"Stage all"},
	["c"] = {"Commit popup"},
	["r"] = {"Rebase popup"},
	["L"] = {"Log popup"},
	["p"] = {"Pull popup"},
	["P"] = {"Push popup"},
	["Z"] = {"Stash popup"},
	["Tab"] = {"Toggle diff (inline)"},
	["?"] = {"Help"},
	["x"] = {"Discard changes"},
	["<enter>"] = {"Go to file"},
	["<C-r>"] = {"Refresh buffer"},
},{buffer=0})

-- wk.register({
-- 	["gu"] = {"Jump to file in Untracked/Unstaged"},
-- 	["gU"] = {"Jump to file in Unstaged"},
-- 	["gs"] = {"Jump to file in Staged"},
-- 	["gp"] = {"Jump to file in Unpushed"},
-- 	["gP"] = {"Jump to file in Unpulled"},
-- 	["gr"] = {"Jump to file in Rebasing"},
-- 	["gi"] = {"Open .git/info/exclude"}
-- },{buffer=0})
