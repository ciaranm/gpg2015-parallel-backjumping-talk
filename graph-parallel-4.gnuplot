# vim: set et ft=gnuplot sw=4 :

set terminal tikz color size 3.5in,2.6in font '\scriptsize'

set output "gen-graph-parallel-4.tex"

set multiplot

set border 3

set arrow from 1000,1839 to 244,1839 lw 1 front filled
set label 1 '$4.1\times$' font '\tiny' at 1000,1839 left offset character -0.1, character 0.2 front

set arrow from 10000,2271 to 1400,2271 lw 1 front filled
set label 2 '$7.1\times$' font '\tiny' at 10000,2271 left offset character -0.1, character 0.2 front

set arrow from 100000,2384 to 14865,2384 lw 1 front filled
set label 3 '$6.7\times$' font '\tiny' at 100000,2384 left offset character -0.1, character 0.2 front

set arrow from 1000000,2420 to 113815,2420 lw 1 front filled
set label 4 '$8.8\times$' font '\tiny' at 1000000,2420 left offset character -0.1, character 0.1 front

set arrow from 10000000,2435 to 268043,2435 lw 1 front filled
set label 5 '$37.3\times$' font '\tiny' at 10000000,2435 left offset character -0.5, character -0.2 front

set arrow from 100000000,2440 to 359256,2440 lw 1 front filled
set label 6 '$278.4\times$' font '\tiny' at 100000000,2440 left offset character -0.1, character 0.2 front

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
    "graph-cumulative.data" u ($7):($7 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\raisebox{2mm}{\phantom{Parallel}}' at end lc "#b30c00" lw 2, \
    "graph-cumulative.data" u ($4):($4 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\phantom{Sequential}' at end lc "#ffb948" lw 2

