#!/usr/bin/env bash

dzen2 \
    -bg '#cb4b16' -fg '#eeeeee' \
    -fn 'monospace:size=10' \
    -e 'button1=exit;leavetitle=exit' \
    "$@"
