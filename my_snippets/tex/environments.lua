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
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return
{
    -- GENERIC ENVIRONMENT
  s({trig="beg", snippetType="autosnippet"},
     fmta(
        [[
        \begin{<>}
            <>
        \end{<>}
      ]],
        {
          i(1),
          i(2),
          rep(1),
        }
  	),
		      { condition = line_begin }
  ),
	
	 s({trig="eqn", snippetType="autosnippet"},
      fmta(
        [[
        \begin{equation}
            <>
        .\end{equation}
      ]],
        {
          i(1),
        }
      ),
      { condition = line_begin }
  ),

		  s({trig="ali", snippetType="autosnippet"},
      fmta(
        [[
        \begin{align}
            <>
        .\end{align}
      ]], 
			{
          i(1),
        }
      ),
      {condition = line_begin}
    ),

	 s({trig="ite", snippetType="autosnippet"},
      fmta(
        [[
        \begin{itemize}
            \item <>
        \end{itemize}
      ]],
        {
          i(0),
        }
      ),
      {condition = line_begin}
    ),
	
	s({trig="enn", snippetType="snippet"},
      fmta(
        [[
        \begin{enumerate}
            \item <>
        \end{enumerate}
      ]],
        {
          i(0),
        }
      )
    ),
	
	 s({trig = "([^%l])mk", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "<>$<>$",
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
        }
      )
    ),

 s({trig = "([^%l])dm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
			  
        [[
        <>\]
           <>
				.\]
				

				]],
        {
          f( function(_, snip) return snip.captures[1] end ),
          i(1),
        }
      )
    ),
  
	s({trig = 'itt', snippetType = "autosnippet"},
	t('\\item'),
	{condition = tex.in_align }
	),

	s("mtemp", fmt([[
  \documentclass[english,a4paper,oneside,article,9pt]{memoir}
  \usepackage{geometry}
  \usepackage[english]{babel}		
  \geometry{total={210mm,297mm},left=20mm,right=20mm,, top=25mm,bottom=25mm}
  \makeatletter\AtBeginDocument{\let\@elt\relax}\makeatother
  \usepackage[utf8]{inputenc}
  \usepackage{microtype}
  \usepackage{graphicx}
  \usepackage{amsmath}
  \usepackage{amssymb}
  \usepackage{amsfonts}
  \usepackage[hidelinks]{hyperref}
  \usepackage[capitalize]{cleveref}
  \usepackage{mathrsfs}
  \usepackage{tcolorbox}
  \numberwithin{equation}{chapter}
  \usepackage{bm}
  \usepackage{braket}

  % Prevent line breaking inline math
  \binoppenalty=\maxdimen
  \relpenalty=\maxdimen

  % Math macros
  \newcommand{\nline}{, \nonumber \\\\ }
  \newcommand{\vk}{\bm{k}}


  \begin{document}
  {\Huge
  \textsc{Title}}\\
  \vspace{1.5mm}
  \hrule
  \vspace{3mm}
  {\large \texttt{J.H Winter}} \hfill {\large \texttt{\today}} 
  \vspace{3mm}

  \begin{tcolorbox}
	  \textbf{The Problem, } <>
  \end{tcolorbox}

  \bibliographystyle{unsrt}
  \bibliography{ref}

  \end{document}

	]], {
    i(1)
}, { delimiters = "<>" }
))
	}
