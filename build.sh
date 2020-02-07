#!/bin/bash

# Check directory and/or Dependencies
# check optipng or not
if ! command -v optipng >/dev/null
then
    echo "Please install optipng"
    exit 1
fi
# check rsvg installed or not
if ! command -v rsvg-convert > /dev/null
then
    echo "Please install librsvg2"
    exit 1
fi
SVG_FOLDER=""
# check SVG directory
[ ! -d *_svg ] && echo "No SVG Directories found" || SVG_FOLDER=$(ls -d *_svg)
[ -z "$SVG_FOLDER" ] && exit 1
# check PNG directory
PNG_FOLDER=$(echo $SVG_FOLDER | sed "s/_svg//")
[ -d "$PNG_FOLDER" ] && rm -rfv "$PNG_FOLDER"
# Resizing SVG to all required files
NUMSVG=$(find "$SVG_FOLDER" -name "sc_*.svg" | wc -l)
echo "Preparing $NUMSVG SVGs ..."
counter=1
find "$SVG_FOLDER" -name "sc_*.svg" | while read i;
do
    CURFILE=`basename $i | cut -d '_' -f 2`
    DIRFILE=`dirname $i`
    # convert to normal size
    rsvg-convert -f svg "$i" -w 32 -a -o "$DIRFILE/$CURFILE"
    # convert to lc size
    rsvg-convert -f svg "$i" -w 24 -a -o "$DIRFILE/lc_$CURFILE"
    current=$((counter%100))
    if [[ "$current" == "0" ]];then
        echo "[$counter/$NUMSVG] ..."
    fi
    let counter++
done

# Export SVG to PNG 
# prepairing for export
cp -r "$SVG_FOLDER" "$PNG_FOLDER"
NUMFILE=$(find "$PNG_FOLDER" -name "*.svg" -o -name "*.SVG" | wc -l)
echo "Processing $NUMFILE files ..."
counter=1
find "$PNG_FOLDER" -name "*.svg" -o -name "*.SVG" | while read i;
do 
    rsvg-convert "$i" -o "${i%.*}.png"
# Optimize (optional)
    optipng -quiet -o7 "${i%.*}.png"
    current=$((counter%100))
    if [[ "$current" == "0" ]];then
        echo "[$counter/$NUMFILE] ..."
    fi
    let counter++
done

# clear svg files
echo "Deleting Unused SVG files ..."
find "$PNG_FOLDER" -name "*.svg" -o -name "*.SVG" | while read i;
do
    rm "$i"
done
sed "s/.svg/.png/g" $PNG_FOLDER/links.txt
# 4 - Create ZIP image for SVG and PNG
echo "Creating ZIP Images"
pushd "$SVG_FOLDER" > /dev/null
zip -q -r -D ../build/"$SVG_FOLDER".zip *
popd > /dev/null
pushd "$PNG_FOLDER" > /dev/null
zip -q -r -D ../build/"$PNG_FOLDER".zip *
popd > /dev/null
# 5 - Copying ZIP to OXT env directory
THEMENAME=$(echo $PNG_FOLDER | sed "s/images_//")
cp build/"$PNG_FOLDER".zip build/"$THEMENAME"-IconSet/iconsets/
cp build/"$SVG_FOLDER".zip build/"$THEMENAME"-SVG-IconSet/iconsets/
# 6 - Create OXT files
echo "Creating Extension Files"
pushd build/"$THEMENAME"-IconSet/ > /dev/null
zip -q -r -D ../"$THEMENAME"-IconSet.oxt *
popd > /dev/null
pushd build/"$THEMENAME"-SVG-IconSet/ > /dev/null
zip -q -r -D ../"$THEMENAME"-SVG-IconSet.oxt *
popd > /dev/null
echo "Path of Generated oxt files:"
echo "=> 1. $PWD/build/$THEMENAME-IconSet.oxt"
echo "=> 2. $PWD/build/$THEMENAME-SVG-IconSet.oxt"