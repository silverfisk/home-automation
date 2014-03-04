#!/usr/bin/gnuplot -persist
set terminal png nocrop font small size 1280,720
set output '/var/www/vardagsrum.png'
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
set title "Temperatur i Vardagsrum (C)"
set ylabel "Temp"
set xlabel "Tid"
#plot "/root/templog.csv" using 1:2 with points notitle, "/root/templog.csv" using 1:2 notitle smooth csplines
plot "/root/templog.csv" using 1:2 with points pointtype 7 pointsize 1 linetype 3 notitle, "/root/templog.csv" using 1:2 notitle smooth csplines
