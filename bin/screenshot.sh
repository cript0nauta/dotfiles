#! /usr/bin/env nix-shell
#! nix-shell -i bash -p maim -p xdotool -p dmenu -p xclip

set -euo pipefail

die(){
    echo "$2"
    exit "$1"
}

case "${1:-region}" in
    region)
        FLAGS="-s -u"
        ;;
    window)
        FLAGS="-i $(xdotool getactivewindow)"
        ;;
    full)
        FLAGS=""
        ;;
    *)
        die 1 "Usage: $0 (region|window|full)"
        ;;
esac

PERMANENT="$HOME/Pictures/"
TEMPNAME="/tmp/screenshot-$(date '+%y%m%d-%H%M%S').png"

# OUTPUT="$({ echo clipboard; echo "$TEMPNAME"; echo "$PERMANENT"; } | dmenu)"
OUTPUT=clipboard

case "$OUTPUT" in
    clipboard)
        maim $FLAGS | xclip -selection clipboard -t image/png
        ;;
    *)
        maim $FLAGS "$OUTPUT"
        echo "$OUTPUT"
        ;;
esac
