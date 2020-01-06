#!/usr/bin/env bash

echo $$ >/tmp/dwm_autostart.pid

xsetroot -solid '#002b36'
xautolock -time 5 -locker i3lock-pixeled -detectsleep &

while true
do
    xsetroot -name "$(acpi | tr '\n' ';') / $(date)"
    sleep 1
done

rm /tmp/dwm_autostart.pid
