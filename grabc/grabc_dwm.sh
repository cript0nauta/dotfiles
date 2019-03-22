#!/usr/bin/env bash
if [[ -f /tmp/dwm_autostart.pid ]]
then
    kill "$(cat /tmp/dwm_autostart.pid)"
fi
xsetroot -name "Select a pixel"
xsetroot -name "$(@out@/bin/grabc)"
sleep 5
exec sh -c 'cd ~/.dwm/; ./autostart.sh &'
