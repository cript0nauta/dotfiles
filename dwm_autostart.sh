#!/usr/bin/env bash

xsetroot -solid '#002b36'
xautolock -time 5 -locker i3lock-pixeled -detectsleep &

(
    while true
    do
        xsetroot -name "$(acpi; date)"
        sleep 1
    done
) &

