#!/bin/bash

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will updated to be Sukapura"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
    #sed -i -e 's/#0040dd/#0078f6/g' "$i" #blue
    #sed -i -e 's/#dcdcdc/#51cdfb/g' "$i" #blue light
    #sed -i -e 's/#0a84ff/#51cdfb/g' "$i" #blue light
    #sed -i -e 's/#eac282/#f16813/g' "$i" #yellow to orange
    #sed -i -e 's/#4d82b8/#0078f6/g' "$i" #yellow to orange
    sed -i -e 's/#0040dd/#409cff/g' "$i" #red
    #sed -i -e 's/#a93f23/#d70015/g' "$i" #red outline
    #sed -i -e 's/#d86344/#28cd41/g' "$i" #green
    #sed -i -e 's/#507c6e/#2a9240/g' "$i" #green outline
  	#convert "$i" -quality 75 "$i"
done
