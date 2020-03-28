#! /usr/bin/env nix-shell
#! nix-shell -i bash -p i3lock -p imagemagick -p scrot

set -euo pipefail

IMGFILE=/tmp/screen.png

takeScreenshot() {
  # Taken fromh ttps://gitlab.com/Ma27/i3lock-pixeled
  # take the actual screenshot
  scrot -o "$IMGFILE"

  # # customize scaling to have a pixeled background
  convert "$IMGFILE" -scale 10% -scale 1000% "$IMGFILE"
}

takeScreenshot
i3lock -i "$IMGFILE" --nofork
