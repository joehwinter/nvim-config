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


--   How To Write Snippets
--
--   s(
--		snippet parameters - Lua Table
--		snippet nodes      - Lua Table
--		options            - Lua Table or Blank
--   )

--   Alternative: using the fmt function to create the node table
--
--   s(
--    snippet paramters - Lua Table
--    fmta(arguments)    - Generates a lua table of noes in a readable fashion 
--    options           - Lua Table or Blanck§
--   )

--   Fmta Usage
--
--   first argument is a lua string e.g:
--   "frac{<>}{<>}"
--   then a table of your nodes, here insert nodes 
--   {i(1),i(2)}
--   fmta will input the nodes wherever there are angle brackets

--   Snippet Parameters 
--
--   {
--     trig = "trigger phrase"
--     dscr = "short description "
--     regTrig = "regex lua expressions - true or false"
--     wordTrig = "stops triggering when part of a bigger word - true or false"
--     priority = "default 1000"
--     snippetType = "automatic, using tab, etc etc"
--   }

-- Some nice tables to help with recognition :))) 

trigo = {
     sin = "sin" , cos = "cos", arccot = "arccot", cot = "cot", csc = "csc", ln = "ln", log = "log", star = "star", perp = "perp"
}



print(trigo['sin'])
return
{
-- Greek Letter Snippets
--	s({trig = ";ps", snippetType = "autosnippet"},
--		{
--			t("\\psi") -- t is for insert text
--		}
--		{condition = tex.utils.in_mathzone}
--	),
	s({trig = ";ph"},
		{
			t("\\phi")
		}
	),
	s({trig = ";a"},
		{
			t("\\alpha")
		},
		{condition = tex.in_mathzone}
	),
	s({trig = ";b", snippetType = "autosnippet"},
		{
			t("\\beta") 
		},
		{condition = tex.in_mathzone}
	),
	s({trig = ";g", snippetType = "autosnippet"},
		{
			t("\\gamma")
		},
		{condition = tex.in_mathzone}
	),
--Maths Snippets 
  -- basic frac
	s({trig = "//", snippetType = "autosnippet"},
		fmta("\\frac{<>}{<>}",
		{i(1),i(2)}),
		{condition = tex.in_mathzone}
	),
	s({trig = "(%w)//", snippetType = "autosnippet"},
		fmta("\\frac{<>}{<>}",
		{
			f( function(_, snip) return snip.captures[1] end ),
			i(1)
		}),
		{condition = tex.in_mathzone}
	),

	s({trig = "([%w%)%]%}])td", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
	),
	 -- subscript
  s({trig = "([%w%)%]%}])__", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
	-- exponentials
  s({trig = '([^%a])ee', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>e^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),
	--daggers
	s({trig = "([%w%)%]%}])dagr", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
				t("\\dagger")
      }
    ),
    {condition = tex.in_mathzone}
  ), 
	--hats
  s({trig = '([^%a])hat', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\hat{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig = '([%w])hat', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "\\hat{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
 --bar
	s({trig = '([^%a])bar', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\overline{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig = '([%w])bar', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "\\overline{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
--vecs 
	s({trig = '([^%a])avec', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\vec{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig = '([%w])avec', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "\\vec{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),


	s({trig = 'iff', snippetType="autosnippet"},
	{t('\\iff')},
	{condition = tex.in_mathzone}
  ),

	s({trig = '>=', snippetType="autosnippet"},
	{t('\\geq')},
	{condition = tex.in_mathzone}
  ),

  s({trig = '<=', snippetType="autosnippet"},
	{t('\\leq')}, 
	{condition = tex.in_mathzone}
  ),

	s({trig = '!=', snippetType="autosnippet"},
	{t('\\neq')}, 
	{condition = tex.in_mathzone}
  ),

	s({trig = '==', snippetType="autosnippet"},
	fmta("&= <> ,\\\\",{i(1)}),
	{condition = tex.in_mathzone}
  ), 
	s({trig = 'pmat', snippetType="autosnippet"},
	fmta("\\begin{pmatrix} <> \\end{pmatrix}",{i(1)}),
	{condition = tex.in_mathzone}
  ), 
	s({trig = 'bmat', snippetType="autosnippet"},
	fmta("\\begin{bmatrix} <> \\end{bmatrix}",{i(1)}),
	{condition = tex.in_mathzone}
  ), 
	s({trig = '()lr', snippetType="autosnippet"},
	fmta("\\left( <> \\right)",{i(1)}),
	{condition = tex.in_mathzone}
  ), 
  s({trig = '[]lr', snippetType="autosnippet"},
	fmta("\\left( <> \\right)",{i(1)}),
	{condition = tex.in_mathzone}
  ),

  s({trig = '<>lr', snippetType="autosnippet"},
	fmta("\\left\\langle <> \\right\\rangle",{i(1)}),
	{condition = tex.in_mathzone}
  ),

	s({trig = 'sum', snippetType="autosnippet"},
	{t('\\sum')}, 
	{condition = tex.in_mathzone}
  ),

	s({trig = 'isum', snippetType="autosnippet"},
	fmta("\\sum_{<>} ",{i(1)}),
  {condition = tex.in_mathzone}
  ),
	 
	s({trig = 'prod', snippetType="autosnippet"},
	{t('\\prod')}, 
	{condition = tex.in_mathzone}
  ),
   
	s({trig = 'part', snippetType="autosnippet"},
	{t('\\partial')}, 
	{condition = tex.in_mathzone}
  ),
   
	s({trig = 'sqrt', snippetType="autosnippet"},
	fmta("\\sqrt{<>}",{i(1)}),
	{condition = tex.in_mathzone}
  ),

	s({trig = 'grad', snippetType="autosnippet"},
	{t('\\nabla')}, 
	{condition = tex.in_mathzone}
  ),

	s({trig = 'xx', snippetType="autosnippet"},
	{t('\\times')}, 
	{condition = tex.in_mathzone}
	),

	s({trig = 'part', snippetType="autosnippet"},
	{t('\\partial')}, 
	{condition = tex.in_mathzone}
  ),

	s({trig = 'sin', snippetType="autosnippet"},
	{t('\\sin')}, 
	{condition = tex.in_mathzone}
  ),

  s({trig = 'sin', snippetType="autosnippet"},
	{t('\\sin')}, 
	{condition = tex.in_mathzone}
  ),

 s({trig = 'cos', snippetType="autosnippet"},
	{t('\\cos')}, 
	{condition = tex.in_mathzone}
  ),

 s({trig = 'arccot', snippetType="autosnippet"},
	{t('\\arccot')}, 
	{condition = tex.in_mathzone}
  ),

 s({trig = 'cot', snippetType="autosnippet"},
	{t('\\cot')}, 
	{condition = tex.in_mathzone}
  ),

 s({trig = 'csc', snippetType="autosnippet"},
	{t('\\csc')}, 
	{condition = tex.in_mathzone}
  ),

s({trig = 'ln', snippetType="autosnippet"},
	{t('\\ln')}, 
	{condition = tex.in_mathzone}
  ),

s({trig = 'log', snippetType="autosnippet"},
	{t('\\log')}, 
	{condition = tex.in_mathzone}
  ),

s({trig = 'star', snippetType="autosnippet"},
	{t('\\star')}, 
	{condition = tex.in_mathzone}
  ),

s({trig = 'perp', snippetType="autosnippet"},
	{t('\\perp')}, 
	{condition = tex.in_mathzone}
  ),

s({trig = 'arccos', snippetType="autosnippet"},
	{t('\\arccos')}, 
	{condition = tex.in_mathzone}
  ),


s({trig = 'arcsin', snippetType="autosnippet"},
	{t('\\arcsin')}, 
	{condition = tex.in_mathzone}
  ),


s({trig = 'arctan', snippetType="autosnippet"},
	{t('\\arctan')}, 
	{condition = tex.in_mathzone}
  ),

	
s({trig = 'pi', snippetType="autosnippet"},
	{t('\\pi')}, 
	{condition = tex.in_mathzone}
  ),


s({trig = 'int', snippetType="autosnippet"},
	{t('\\int')}, 
	{condition = tex.in_mathzone}
  ),

s({trig = 'dint', snippetType="autosnippet"},
	fmta('\\int \\mathrm{d} <>',{i(1)}), 
	{condition = tex.in_mathzone}
  ),

s({trig = 'invs', snippetType="autosnippet"},
	{t('^{-1}')}, 
	{condition = tex.in_mathzone}
  ),

s({trig = 'oo', snippetType="autosnippet"},
	{t('\\infty')}, 
	{condition = tex.in_mathzone}
  ),

s({trig = '~~', snippetType="autosnippet"},
	{t('\\sim')}, 
	{condition = tex.in_mathzone}
  ),

	s({trig = 'set', snippetType="autosnippet"},
	fmta('\\{ <> \\}', {i(1)} ), 
	{condition = tex.in_mathzone}
  ),

s({trig = 'ele', snippetType="autosnippet"},
	{t('\\inn')}, 
	{condition = tex.in_mathzone}
  ),



}


