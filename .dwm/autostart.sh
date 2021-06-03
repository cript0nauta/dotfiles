#!/usr/bin/env bash

xsetroot -solid '#002b36'
pgrep xautolock || xautolock \
    -time 5 \
    -locker lock \
    -notify 5 -notifier 'echo "Screen will be locked" | notify -p 5' &
slstatus &
monit
xbindkeys
pgrep firefox || firefox &
pgrep thunderbird || thunderbird &
pgrep telegram || telegram-desktop &
sct 5600
