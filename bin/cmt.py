#! /usr/bin/env nix-shell
#! nix-shell -p python3 -i python

import os
import sys
import time
import signal
import datetime

def pad(n):
    return str(n).rjust(2, '0')

def show_text(text):
    if to_dwm:
        os.system(f"xsetroot -name '{text}'")
    else:
        print(text)

def sigterm(_, __):
    os.system('slstatus &')
    sys.exit(0)

to_dwm = '-s' not in sys.argv

if 'stop' in sys.argv:
    os.system('pkill -f cmt.py')
    sys.exit(0)

if to_dwm:
    signal.signal(signal.SIGTERM, sigterm)
    signal.signal(signal.SIGINT, sigterm)

if to_dwm:
    os.system('pkill slstatus')

start = datetime.datetime.now()

while True:
    td = datetime.datetime.now() - start
    h = td.seconds // 3600
    td -= datetime.timedelta(hours=h)
    m = td.seconds // 60
    s = td.seconds % 60
    text = f'{pad(h)}:{pad(m)}:{pad(s)}'
    show_text(text)
    time.sleep(1)
