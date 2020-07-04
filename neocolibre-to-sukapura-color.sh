#!/bin/bash

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will updated to be Sukapura"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
    #sed -i -e 's/#3a3a38/#4b4b4f/g' "$i" #dark grey
    sed -i -e 's/#3a3a38/#616165/g' "$i" #dark grey
    sed -i -e 's/#797774/#98989d/g' "$i" #grey
    sed -i -e 's/#006381/#0040dd/g' "$i" #dark blue
    sed -i -e 's/#1e8bcd/#409cff/g' "$i" #blue
    sed -i -e 's/#fb983b/#ffd60a/g' "$i" #yellow
    sed -i -e 's/#hmmm/#e4b500/g' "$i" #dark yellow
    #sed -i -e 's/#eac282/#ff9500/g' "$i" #orange
    #sed -i -e 's/#e78e46/#ff9500/g' "$i" #orange
    sed -i -e 's/#c11032/#ff9500/g' "$i" #dark red
    sed -i -e 's/#ed3d3b/#d70015/g' "$i" #red
    sed -i -e 's/#18ab50/#2a9240/g' "$i" #green
    sed -i -e 's/#309048/#007018/g' "$i" #dark green
    sed -i -e 's/#a846b2/#8944ab/g' "$i" #purple
    sed -i -e 's/#922e9b/#8944ab/g' "$i" #dark purple
    sed -i -e 's/#fafafa/#fcfdff/g' "$i" #white
	#convert "$i" -quality 75 "$i"
done
