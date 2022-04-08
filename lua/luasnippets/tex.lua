return {
	s("plus", fmta([[\pgfmathtruncatemacro{<>plus}{<> + 1}]], { i(1), rep(1) })),
	s("minus", fmta([[\pgfmathtruncatemacro{<>minus}{<> - 1}]], { i(1), rep(1) })),
	s(
		"begin",
		fmta(
			[[
	\begin{<1>}
	    <2>
	\end{<3>}
	]],
			{ i(1), i(0), rep(1) }
		)
	),
	s(
		"frame",
		fmta(
			[[
	\begin{frame}{<>}
	    <>
	\end{frame}
	]],
			{ i(1, "Title"), i(0) }
		)
	),
	s(
		"tikz",
		fmta(
			[[
	\begin{tikzpicture}
	    <1>
	\end{tikzpicture}
	]],
			{ i(0) }
		)
	),
	s(
	"vhbox",
	fmta(
	[[
	\vcenter{\hbox{
		<>
	}}
	]]
	,i(0)
	)
	)
}
