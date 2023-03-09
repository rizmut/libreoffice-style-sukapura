#!/bin/bash
#2020 by Rizal Muttaqin

links_light="sukapura_svg/links.txt"
links_dark="sukapura_dark_svg/links.txt"

if ! command -v optipng >/dev/null
then
    echo "Please install optipng"
    exit 1
fi

if ! command -v svgcleaner >/dev/null
then
    echo "Please install svgcleaner"
    exit 1
fi

echo "=> Remove old both light and dark version"

rm -Rf "sukapura"
rm -Rf "sukapura_dark"
rm -Rf "sukapura_dark_svg"

cd "sukapura_svg"

echo "=> Clean SVG files ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file is compressed"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	svgcleaner "$i" "${i%.*}.svg"
done

cd "./.."

cp -Rf "sukapura_svg" \
   "sukapura"
cd "sukapura"

echo "=> 1. sukapura PNG (light) version"
echo "=> Export light SVG to PNG ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file is compressed"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	inkscape -p "$i" -o "${i%.*}.png"
	optipng -o7 "${i%.*}.png"
	#convert "$i" -quality 75 "$i"
done

echo "=> Delete light SVG files ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do
    fname=$( basename "$i")
    fdir=$( dirname "$i")
    rm "$i"
done

echo "=> 2. sukapura SVG (dark) version"
cd "./.."

cp -Rf "sukapura_svg" \
   "sukapura_dark_svg"

cd "sukapura_dark_svg"   

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
    echo "This $i file will be Dark Theme"
    fname=$( basename "$i")
#	echo "has the name: $fname"
    fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -p "$i" -o "${i%.*}.png"
	#Light to Dark
    sed -i -e 's/#f2f2f7/#2d2d2d/g' "$i" #
    sed -i -e 's/#e5e5ea/#2d2d2d/g' "$i" #
    sed -i -e 's/#c7c7cc/#5b5b5b/g' "$i" #TransitionA1
    sed -i -e 's/#d1d1d6/#acacac/g' "$i" #TransitionB1
    #Dark Grey to Light
    sed -i -e 's/#48484a/#f2f2f7/g' "$i" #
    sed -i -e 's/#8e8e93/#f2f2f7/g' "$i" #
    sed -i -e 's/#aeaeb2/#e5e5ea/g' "$i" #
    #Dark to Light
    sed -i -e 's/#1c1c1e/#98989d/g' "$i" #ImpressFloatingInsert 
    sed -i -e 's/#48484a/#98989d/g' "$i" #
    sed -i -e 's/#3a3a3c/#d1d1d6/g' "$i" #
    #Light to Dark (2)
    sed -i -e 's/#7b7b7b/#e5e5ea/g' "$i" #TransitionA2
    sed -i -e 's/#acacac/#3a3a3c/g' "$i" #TransitionB2
    #Blue
    sed -i -e 's/#0040dd/#409cff/g' "$i" #AccessibleLighttoDark
    sed -i -e 's/#007aff/#0a84ff/g' "$i" #DefaultLighttoDark
    #Orange
    sed -i -e 's/#c93400/#ff6961/g' "$i" #AccessibleLighttoDark
    sed -i -e 's/#ff9500/#ff9f0a/g' "$i" #DefaultLighttoDark
    #Yellow
    sed -i -e 's/#a05a00/#ffd426/g' "$i" #AccessibleLighttoDark
    sed -i -e 's/#ffcc00/#ffd60a/g' "$i" #DefaultLighttoDark
    #Green
    sed -i -e 's/#007d1b/#31de4b/g' "$i" #AccessibleLighttoDark
    sed -i -e 's/#28cd41/#28d74b/g' "$i" #DefaultLighttoDark
    #Red
    sed -i -e 's/#d70015/#ff6482/g' "$i" #AccessibleLighttoDark
    sed -i -e 's/#ff453a/#ff453a/g' "$i" #DefaultLighttoDark
    #Cyan
    sed -i -e 's/#0071a4/#70d7ff/g' "$i" #AccessibleLighttoDark
    sed -i -e 's/#55bef0/#5ac8f5/g' "$i" #DefaultLighttoDark
    #Purple
    sed -i -e 's/#ad44ab/#da8fff/g' "$i" #AccessibleLighttoDark
    sed -i -e 's/#af52de/#bf5af2/g' "$i" #DefaultLighttoDark
    #Brown
    sed -i -e 's/#7f6545/#b59469/g' "$i" #AccessibleLighttoDark
    sed -i -e 's/#a2845e/#ac8e68/g' "$i" #DefaultLighttoDark
	#convert "$i" -quality 75 "$i"
done 

echo "=> 3. sukapura PNG (dark) version"
cd "./.."

cp -Rf "sukapura_dark_svg" \
   "sukapura_dark"
cp "sukapura/links.txt" \
   "sukapura_dark"   
cd "sukapura_dark" 

echo "=> Export dark SVG to PNG ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file is compressed"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	inkscape -p "$i" -o "${i%.*}.png"
	optipng -o7 "${i%.*}.png"
	#convert "$i" -quality 75 "$i"
done 

echo "=> Delete dark SVG files ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do
    fname=$( basename "$i")
    fdir=$( dirname "$i")
    rm "$i"
done

cd "./.."
echo "delete links.txt in SVG directories"

if [ -f $links_light ] ; then
    rm $links_light
fi

if [ -f $links_dark ] ; then
    rm $links_dark
fi
