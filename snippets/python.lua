local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local opt = require("luasnip.nodes.optional_arg")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

return {
	s({ trig = "#md", snippetType = "autosnippet" }, {
		c(1, {
			sn(nil, {
				t({ "# %% [markdown]", 'r"""', "" }),
				i(1),
				t({ "", '"""', "" }),
				i(0),
			}),
			sn(nil, {
				t({ "# %% [markdown]", '"""', "" }),
				i(1),
				t({ "", '"""', "" }),
				i(0),
			}),
		}),
	}),
	s({ trig = "#py", snippetType = "autosnippet" }, {
		t({ "# %%", "" }),
	}),
	s({ trig = "#re", snippetType = "autosnippet" }, {
		c(1, {
			sn(nil, {
				t({ "# %%", "# %%render", "" }),
				i(1),
			}),
			sn(nil, {
				t("# %%"),
				t({ "", "set_params_columns(" }),
				i(1, "3"),
				t({ ")", "", "# %%", "# %%render params", "" }),
				i(0),
			}),
			sn(nil, {
				t({ "# %%", "# %%render long", "" }),
				i(1),
			}),
		}),
	}),
	-- s({ trig = "#re", snippetType = "autosnippet" }, {
	-- 	t("# %%"),
	-- 	t({ "", "# %%render " }),
	-- 	c(1, {
	-- 		t(""),
	-- 		t("params"),
	-- 	}),
	-- 	t({ "", "" }),
	-- 	i(0),
	-- }),
}
