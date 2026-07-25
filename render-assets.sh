#!/usr/bin/env bash
set -ueo pipefail

if [[ ! "$(command -v inkscape || command -v rendersvg)" ]]; then
  echo "'inkscape' or 'resvg' needs to be installed to generate the PNG."
  exit 1
fi

if [[ ! "$(command -v optipng)" ]]; then
  echo "'optipng' needs to be installed to optimize the resulting PNG."
fi

gtk() (
  cd src/gtk-3.0
  ./render-assets.sh
)

case "${1:-}" in
""|gtk)
  gtk
  ;;
*)
  echo "Unknown argument '$1'"
  echo "Use 'gtk' as an argument."
  exit 1
  ;;
esac
