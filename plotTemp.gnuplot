#!/usr/bin/gnuplot -persist
set terminal png nocrop font small size 1280,720
set autoscale
#set yrange [18:26]
set grid ytics
set style data line
set xdata time
set timefmt "%Y-%m-%dT%H:%M:%S"
set format x "%Y-%m-%d %H:%M"
#set xtics font "Times-Roman, 8"
set xtics font ", 8"
set xtics rotate
set xtics autofreq
set title "Temperatures (C)"
set ylabel "Temp"
set xlabel "Tid"
#
# Plot Livingroom graph
set output '/var/www/livingroom.png'
plot "/root/templog.csv" using 1:2 with points pointtype 7 pointsize 1 linetype 3 notitle, "/root/templog.csv" using 1:2 smooth csplines title "Livingroom"
# Plot Outside temp graph
set output '/var/www/outside.png'
plot "/root/outsidetemp.csv" using 1:2 with dots notitle, "/root/outsidetemp.csv" using 1:2 smooth csplines linetype 9 title "Outside"
