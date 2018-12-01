#!/bin/sh

set -e

gh_repo="libreoffice-style-colibrex"
gh_desc="colibrex LibreOffice icon themes"

cat <<- EOF

  $gh_desc
  https://github.com/rizmut/$gh_repo
  
  
EOF

temp_dir="$(mktemp -d)"

cd "images_colibrex"
zip -r -D images_colibrex.zip *
mv "images_colibrex.zip" \
  "./../build/"
cd "./../build/"
echo "=> Deleting old $gh_desc extension file ..."
rm -f "Colibrex-IconSet.oxt"
echo "=> Create new $gh_desc extension one ..."
cp "images_colibrex.zip" \
   "Colibrex-IconSet/iconsets"
cd "./Colibrex-IconSet"
zip -r -D Colibrex-IconSet.oxt *
mv "Colibrex-IconSet.oxt" \
   "./.."
cd "./../.."
echo "=> Deleting old $gh_desc ..."
sudo rm -f "/usr/share/libreoffice/share/config/images_colibrex.zip"
echo "=> Installing ..."
sudo mkdir -p "/usr/share/libreoffice/share/config"
sudo cp \
  "build/images_colibrex.zip" \
  "/usr/share/libreoffice/share/config"
for dir in \
  /usr/lib64/libreoffice/share/config \
  /usr/lib/libreoffice/share/config \
  /usr/local/lib/libreoffice/share/config \
  /opt/libreoffice*/share/config; do
  [ -d "$dir" ] || continue
  sudo ln -sf "/usr/share/libreoffice/share/config/images_colibrex.zip" "$dir"
done
echo "=> Done!"
