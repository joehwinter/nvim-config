local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


local line_begin = require("luasnip.extras.expand_conditions").line_begin


    -- GENERIC ENVIRONMENT


return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  ls.snippet(
    { trig = "hi" },
    { t("Hello, world!") }
  ),

  -- To return multiple snippets, use one `return` statement per snippet file
  -- and return a table of Lua snippets.
  require("luasnip").snippet(
    { trig = "foo" },
    { t("Another snippet.") }
  ),

	  -- Paired parentheses
  s({trig="(",  wordTrig = false, snippetType="autosnippet"},
    {
      t("("),
      i(1),
      t(")"),
  }),
  s({trig="[",  wordTrig = false, snippetType="autosnippet"},
    {
      t("["),
      i(1),
      t("]"),
		}),
   s({trig="{",  wordTrig = false, snippetType="autosnippet"},
    {
      t("{"),
      i(1),
      t("}"),
    }),

     s({trig="Cell", snippetType="autosnippet"},
     fmta(
        "#%% CELL START \n<>",
        {
          i(1),
        }
  	),
		      { condition = line_begin }
  )
	
}



