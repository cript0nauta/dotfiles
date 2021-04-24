#!/usr/bin/env bash

xsetroot -solid '#002b36'
pgrep xautolock -time 5 -locker lock -detectsleep &
slstatus &
xbindkeys
pgrep firefox || firefox &
pgrep thunderbird || thunderbird &
pgrep telegram || telegram-desktop &
