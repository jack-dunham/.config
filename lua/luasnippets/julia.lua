local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local snippets = {
	s("lf", {
		t({ [[@doc raw"""]], "\t" }),
		f(
		function(args, snip)
			return args[1]
		end,
		{ 1 }),
		t({"", "", "TODO: docstring", [["""]], "" }),t("function "),
		sn(1, {
			i(1),
			t("("),
			i(2),
			t(") "),
			c(3, {
				t(""),
				{
					t("where {"),
					i(1, "T"),
					t("}"),
				},
			}),
		}),
		t(""),
		t({ "", "\t" }),
		i(0),
		t({ "", "end" }),
	}),
	s("mf", {
		t("function "),
		i(1),
		t("."),
		i(2),
		t("("),
		i(3),
		t({ ")", "" }),
		t("\t"),
		i(0),
		t({ "", "end" }),
	}),
}

return snippets
