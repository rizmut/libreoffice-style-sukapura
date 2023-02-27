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
    sed -i -e 's/#98989d/#f2f2f7/g' "$i" #outline grey to light (6)
    sed -i -e 's/#3e3e3e/#f2f2f7/g' "$i" #dark grey to light (6)
    sed -i -e 's/#d6d6d6/#1c1c1e/g' "$i" #dark grey to light (6)
    sed -i -e 's/#69696e/#f2f2f7/g' "$i" #outline dark grey to light (6)
    sed -i -e 's/#848489/#f2f2f7/g' "$i" #outline dark grey to light (6)
    sed -i -e 's/#e5e5ea/#e5e5ea/g' "$i" #outline dark grey to light (5)
    sed -i -e 's/#616165/#e5e5ea/g' "$i" #outline dark grey to light (5)
    sed -i -e 's/#fff/#1c1c1e/g' "$i" #white to darkest grey (6)
    sed -i -e 's/#e9e9e9/#1c1c1e/g' "$i" #white to darkest grey (6)
    sed -i -e 's/#efefef/#1c1c1e/g' "$i" #white to darkest grey (6)
    sed -i -e 's/#e5eefc/#1c1c1e/g' "$i" #white to darkest grey (6)
    sed -i -e 's/#fdf9f3/#1c1c1e/g' "$i" #white to darkest grey (6)
    sed -i -e 's/#ebebeb/#1c1c1e/g' "$i" #white to darkest grey (6)
    sed -i -e 's/#e5eefc/#2c2c2e/g' "$i" #white 2 gray (5)
    sed -i -e 's/#f7f7f7/#2c2c2e/g' "$i" #white 2 gray (5)
    sed -i -e 's/#fdfdfd/#2c2c2e/g' "$i" #white 2 gray (5)
    sed -i -e 's/#fcfdff/#2c2c2e/g' "$i" #white 2 gray (5)
    sed -i -e 's/#fcfcfc/#2c2c2e/g' "$i" #white 2 gray (5)
    sed -i -e 's/#f8f8f8/#2c2c2e/g' "$i" #white 2 gray (5)
    sed -i -e 's/#f3f3f3/#3a3a3c/g' "$i" #white 3 gray (4)
    sed -i -e 's/#f2f2f2/#2c2c2e/g' "$i" #white 2 gray (5)
    sed -i -e 's/#f6f6f6/#2c2c2e/g' "$i" #white 2 gray (5)
    sed -i -e 's/#444446/#3a3a3c/g' "$i" #white 3 gray (4)
    sed -i -e 's/#fbfbfb/#3a3a3c/g' "$i" #white 3 gray (4)
    sed -i -e 's/#f1f1f1/#2c2c2e/g' "$i" #white 2 gray (5)
    sed -i -e 's/#d5d5d5/#3a3a3c/g' "$i" #white 3 gray (4)
    sed -i -e 's/#dadada/#3a3a3c/g' "$i" #white 3 gray (4)
    sed -i -e 's/#f5f5f5/#2c2c2e/g' "$i" #white 2 gray (5)
    sed -i -e 's/#2f2f31/#f2f2f7/g' "$i" #almost black to light (6)
    sed -i -e 's/#a2a2a7/#f2f2f7/g' "$i" #gray to light (6)
    sed -i -e 's/#4b4b4f/#d1d1d6/g' "$i" #gray to  light (4)
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
