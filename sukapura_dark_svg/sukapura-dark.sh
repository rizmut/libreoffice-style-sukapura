#!/bin/bash

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will updated to be Sukapura Dark style"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
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
#     sed -i -e 's/#0063b1/#0063b0/g' "$i" #darkest blue to intermediary darkest blue
#     sed -i -e 's/#83beec/#0063b1/g' "$i" #light blue to darkest blue
#     sed -i -e 's/#0063b0/#83beec/g' "$i" #intermediary darkest blue to light blue
#     sed -i -e 's/#922e9b/#922e9a/g' "$i" #darkest purple to intermediary darkest purple
#     sed -i -e 's/#d492d8/#922e9b/g' "$i" #light purple to darkest purple
#     sed -i -e 's/#922e9a/#d492d8/g' "$i" #intermediary darkest purple to light purple
#     sed -i -e 's/#d42314/#d42313/g' "$i" #darkest red to intermediary darkest red
#     sed -i -e 's/#ff9198/#d42314/g' "$i" #light red to darkest red
#     sed -i -e 's/#d42313/#ff9198/g' "$i" #intermediary darkest red to light red
#     sed -i -e 's/#309048/#309047/g' "$i" #darkest green to intermediary darkest green
#     sed -i -e 's/#a1ddaa/#309048/g' "$i" #light green to darkest green
#     sed -i -e 's/#309047/#a1ddaa/g' "$i" #intermediary darkest green to light green
#     sed -i -e 's/#ed8733/#ed8732/g' "$i" #darkest orange to intermediary darkest orange
#     sed -i -e 's/#f8db8f/#ed8733/g' "$i" #light orange to darkest orange
#     sed -i -e 's/#ed8732/#f8db8f/g' "$i" #intermediary darkest orange to light orange
   	#convert "$i" -quality 75 "$i"
done
