#!/bin/bash

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will updated to be Sukapura"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
    sed -i -e 's/#eac282/#28cd41/g' "$i"
    sed -i -e 's/#4d82b8/#007aff/g' "$i"
    sed -i -e 's/#808080/#4b4b4f/g' "$i"
    sed -i -e 's/#e68497/#ff2d55/g' "$i"
    sed -i -e 's/#ff2d55/#28cd41/g' "$i"
   	#convert "$i" -quality 75 "$i"
done
