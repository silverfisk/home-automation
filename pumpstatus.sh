#!/bin/bash

STATUS=$(/usr/bin/tdtool --list |egrep '^4' |awk '{print $7}')

echo "Heat pump statis is: $STATUS. Status last checked $(date)"
