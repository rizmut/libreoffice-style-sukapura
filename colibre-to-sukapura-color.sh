#!/bin/bash

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will updated to be Sukapura"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
    sed -i -e 's/#696969/#4b4b4f/g' "$i" #grey
    sed -i -e 's/#808080/#98989d/g' "$i" #grey
    sed -i -e 's/#39648f/#0040dd/g' "$i" #blue
    sed -i -e 's/#4d82b8/#0040dd/g' "$i" #blue
    sed -i -e 's/#eac282/#ffd60a/g' "$i" #yellow
    sed -i -e 's/#eac082/#e4b500/g' "$i" #dark yellow
    #sed -i -e 's/#eac282/#ff9500/g' "$i" #orange
    sed -i -e 's/#e78e46/#ff9500/g' "$i" #orange
    sed -i -e 's/#d46e1c/#ff9500/g' "$i" #orange
    sed -i -e 's/#d65532/#d70015/g' "$i" #red
    sed -i -e 's/#dc526d/#d70015/g' "$i" #red
    sed -i -e 's/#e68497/#d70015/g' "$i" #red
    sed -i -e 's/#76a797/#2a9240/g' "$i" #green
    sed -i -e 's/#588878/#2a9240/g' "$i" #green
	#convert "$i" -quality 75 "$i"
done
