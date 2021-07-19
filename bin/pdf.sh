#!/usr/bin/env bash

set -euo pipefail

FILENAME="$(zathura-recent | dmenu -i -l 15)"
[ "$?" = 0 ] && zathura "${FILENAME}"
