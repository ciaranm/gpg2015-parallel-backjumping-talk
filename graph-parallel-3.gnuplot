# vim: set et ft=gnuplot sw=4 :

set terminal tikz color size 3.5in,2.6in font '\scriptsize'

set output "gen-graph-parallel-3.tex"

set multiplot

set border 3

set nokey
set xlabel "Runtime (ms)"
set ylabel "Cumulative Number of Instances Solved"
set logscale x
set xtics nomirror
set ytics nomirror add ('2487' 2487)
set grid xtics ytics mytics
set xrange [1e2:1e8]
set yrange [1800:2487]
set format x '$10^{%T}$'

plot \
    "graph-cumulative.data" u ($7):($7 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\raisebox{2mm}{Parallel}' at end lc "#b30c00" lw 2, \
    "graph-cumulative.data" u ($4):($4 >= 1e8 ? 1e-10 : 1) smooth cumulative ti 'Sequential' at end lc "#ffb948" lw 2, \

