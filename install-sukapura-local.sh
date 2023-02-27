#!/bin/sh

set -e

gh_repo="libreoffice-style-sukapura"
gh_desc="sukapura LibreOffice icon themes"

cat <<- EOF

  $gh_desc
  https://github.com/rizmut/$gh_repo
  
  
EOF

temp_dir="$(mktemp -d)"

# Sukapura
cd "sukapura"
cp "links.txt" \
   "../sukapura_dark"
zip -r -D images_sukapura.zip *
mv "images_sukapura.zip" \
  "./../build/"
cd "./../build/"
echo "=> Deleting old $gh_desc extension file ..."
rm -f "Sukapura-IconSet.oxt"
echo "=> Create new $gh_desc extension one ..."
cp "images_sukapura.zip" \
   "Sukapura-IconSet/iconsets"
cd "./Sukapura-IconSet"
zip -r -D Sukapura-IconSet.oxt *
mv "Sukapura-IconSet.oxt" \
   "./.."
cd "./../.."

# Sukapura Dark
cd "sukapura_dark"
zip -r -D images_sukapura_dark.zip *
mv "images_sukapura_dark.zip" \
  "./../build/"
cd "./../build/"
echo "=> Deleting old $gh_desc extension file (dark) ..."
rm -f "Sukapura-Dark-IconSet.oxt"
echo "=> Create new $gh_desc extension one (dark) ..."
cp "images_sukapura_dark.zip" \
   "Sukapura-Dark-IconSet/iconsets"
cd "./Sukapura-Dark-IconSet"
zip -r -D Sukapura-Dark-IconSet.oxt *
mv "Sukapura-Dark-IconSet.oxt" \
   "./.."
cd "./../.."

# sukapura SVG
cd "sukapura_svg"
zip -r -D images_sukapura_svg.zip *
mv "images_sukapura_svg.zip" \
  "./../build/"
cd "./../build/"
echo "=> Deleting old $gh_desc extension file (SVG) ..."
rm -f "Sukapura-SVG-IconSet.oxt"
echo "=> Create new $gh_desc extension one (SVG) ..."
cp "images_sukapura_svg.zip" \
   "Sukapura-SVG-IconSet/iconsets"
cd "./Sukapura-SVG-IconSet"
zip -r -D Sukapura-SVG-IconSet.oxt *
mv "Sukapura-SVG-IconSet.oxt" \
   "./.."
cd "./../.."

# sukapura Dark SVG
cd "sukapura_dark_svg"
zip -r -D images_sukapura_dark_svg.zip *
mv "images_sukapura_dark_svg.zip" \
  "./../build/"
cd "./../build/"
echo "=> Deleting old $gh_desc extension file (dark SVG) ..."
rm -f "Sukapura-Dark-SVG-IconSet.oxt"
echo "=> Create new $gh_desc extension one (dark SVG) ..."
cp "images_sukapura_dark_svg.zip" \
   "Sukapura-Dark-SVG-IconSet/iconsets"
cd "./Sukapura-Dark-SVG-IconSet"
zip -r -D Sukapura-Dark-SVG-IconSet.oxt *
mv "Sukapura-Dark-SVG-IconSet.oxt" \
   "./.."
cd "./../.."

echo "=> Deleting whole old $gh_desc ..."
sudo rm -f "/usr/share/libreoffice/share/config/images_sukapura.zip"
sudo rm -f "/usr/share/libreoffice/share/config/images_sukapura_dark.zip"
sudo rm -f "/usr/share/libreoffice/share/config/images_sukapura_svg.zip"
sudo rm -f "/usr/share/libreoffice/share/config/images_sukapura_dark_svg.zip"
echo "=> Installing ..."
sudo mkdir -p "/usr/share/libreoffice/share/config"
sudo cp \
  "build/images_sukapura.zip" \
  "/usr/share/libreoffice/share/config"
sudo cp \
  "build/images_sukapura_dark.zip" \
  "/usr/share/libreoffice/share/config"
sudo cp \
  "build/images_sukapura_svg.zip" \
  "/usr/share/libreoffice/share/config"
sudo cp \
  "build/images_sukapura_dark_svg.zip" \
  "/usr/share/libreoffice/share/config"
for dir in \
  /usr/lib64/libreoffice/share/config \
  /usr/lib/libreoffice/share/config \
  /usr/local/lib/libreoffice/share/config \
  /opt/libreoffice*/share/config; do
  [ -d "$dir" ] || continue
  sudo ln -sf "/usr/share/libreoffice/share/config/images_sukapura.zip" "$dir"
  sudo ln -sf "/usr/share/libreoffice/share/config/images_sukapura_dark.zip" "$dir"
  sudo ln -sf "/usr/share/libreoffice/share/config/images_sukapura_svg.zip" "$dir"
  sudo ln -sf "/usr/share/libreoffice/share/config/images_sukapura_dark_svg.zip" "$dir"
done
echo "=> Done!"
