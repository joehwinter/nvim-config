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
-- Some LaTeX-specific conditional expansion functions (requires VimTeX)
-- Math context detection 
local tex = require('joe.snips.latex') 

return {
s({trig = 'tt', snippetType="autosnippet"},
	fmta('\\text{<>}',{i(1)}), 
	{condition = tex.in_mathzone}
  ),
s({trig = 'mbb', snippetType="autosnippet"},
	fmta('\\mathbb{<>}',{i(1)}), 
	{condition = tex.in_mathzone}
  ),
s({trig = 'mcal', snippetType="autosnippet"},
	fmta('\\mathcal{<>}',{i(1)}), 
	{condition = tex.in_mathzone}
  ),
s({trig = 'mscr', snippetType="autosnippet"},
	fmta('\\mathscr{<>}',{i(1)}), 
	{condition = tex.in_mathzone}
  ),
s({trig = 'tbf', snippetType="autosnippet"},
	fmta('\\textbf{<>}',{i(1)}), 
	{condition = tex.in_text}
  ),
s({trig = 'tit', snippetType="autosnippet"},
	fmta('\\textit{<>}',{i(1)}), 
	{condition = tex.in_text}
  ),
}
