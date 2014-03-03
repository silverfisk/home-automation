#!/usr/bin/gnuplot -persist
set terminal png nocrop font small size 1280,720
set output '/var/www/vardagsrum.png'
set autoscale
set style data line
set xdata time
set timefmt "%Y-%m-%dT%H:%M:%S"
set format x "%Y-%d-%m %H:%M"
set xtics font ", 8"
set xtics rotate
set xtics autofreq
set title "Temperatur i Vardagsrum (C)"
set ylabel "Temp"
set xlabel "Tid"
plot "/root/templog.csv" using 1:2 with points notitle, "/root/templog.csv" using 1:2 notitle
