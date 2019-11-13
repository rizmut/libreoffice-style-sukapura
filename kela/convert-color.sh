#!/bin/bash

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will updated to be Sukapura"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
    sed -i -e 's/#0040dd/#0078f6/g' "$i" #blue
    sed -i -e 's/#dcdcdc/#51cdfb/g' "$i" #blue light
    sed -i -e 's/#0a84ff/#51cdfb/g' "$i" #blue light

  	#convert "$i" -quality 75 "$i"
done
