#!/bin/sh

set -e

gh_repo="libreoffice-style-sukapura"
gh_desc="Sukapura LibreOffice icon themes"

cat <<- EOF

  $gh_desc
  https://github.com/rizmut/$gh_repo
  
  
EOF

echo "=> Removing $gh_desc ..."
for dir in \
  /usr/share/libreoffice/share/config \
  /usr/lib/libreoffice/share/config \
  /usr/lib64/libreoffice/share/config \
  /usr/local/lib/libreoffice/share/config \
  /opt/libreoffice*/share/config; do
  [ -d "$dir" ] || continue
  sudo rm -f "$dir/images_sukapura.zip"
  sudo rm -f "$dir/images_sukapura_dark.zip"
  sudo rm -f "$dir/images_sukapura_dark_svg.zip"
  sudo rm -f "$dir/images_sukapura_svg.zip"
done
echo "=> Done!"
