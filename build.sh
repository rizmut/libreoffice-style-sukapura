#!/bin/bash

if ! command -v optipng >/dev/null
then
    echo "Please install optipng"
    exit 1
fi

cp -Rf "images_sukapura_svg" \
   "images_sukapura"
rm "images_sukapura_svg/links.txt"
cd "images_sukapura"

echo "=> Export SVG to PNG ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file is compressed"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	inkscape -f "$i" -e "${i%.*}.png"
	optipng -o7 "${i%.*}.png"
	#convert "$i" -quality 75 "$i"
done

echo "=> Delete SVG files ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do
    fname=$( basename "$i")
    fdir=$( dirname "$i")
    rm "$i"
done
