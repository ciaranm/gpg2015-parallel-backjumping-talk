# vim: set et ft=gnuplot sw=4 :

set terminal tikz color size 3.5in,2.6in font '\scriptsize'

set output "gen-graph-parallel-1.tex"

set multiplot

set border 3

set nokey
set xlabel "Runtime (ms)"
set ylabel "Cumulative Number of Instances Solved"
set logscale x
set xtics nomirror
set ytics nomirror add ('2487' 2487)
set grid xtics ytics mytics
set xrange [1:1e8]
set yrange [0:2487]
set format x '$10^{%T}$'

plot \
    "graph-cumulative.data" u ($7):($7 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\raisebox{3mm}{\phantom{Parallel}}' at end lc "#ffb30c00" lw 2, \
    "graph-cumulative.data" u ($9):($9 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\raisebox{-1mm}{SND}' at end lc "#009dec" lw 2, \
    "graph-cumulative.data" u ($3):($3 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\raisebox{-3mm}{LAD}' at end lc "#951272" lw 2, \
    "graph-cumulative.data" u ($8):($8 >= 1e8 ? 1e-10 : 1) smooth cumulative ti 'VF2' at end lc "#84bd00" lw 2, \
    "graph-cumulative.data" u ($4):($4 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\raisebox{1mm}{Sequential}' at end lc "#ffb948" lw 2, \

