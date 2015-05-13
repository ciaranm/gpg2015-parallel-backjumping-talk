all : tables graphs
	latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode %O %S' talk

TABLES =

GRAPHS = gen-graph-speedup.tex gen-graph-parallel-1.tex gen-graph-parallel-2.tex \
	 gen-graph-parallel-3.tex gen-graph-parallel-4.tex

tables : $(TABLES)

graphs : $(GRAPHS)

gen-graph-%.tex : graph-%.gnuplot
	gnuplot $<

