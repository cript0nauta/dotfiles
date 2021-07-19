import os
import sys
import base64
import binascii
import configparser

HISTORY_FILE = '~/.local/share/zathura/history'

config = configparser.ConfigParser()
if not config.read(os.path.expanduser(HISTORY_FILE)):
    print('config file not found', file=sys.stderr)
    exit(1)

def all_recent_files():
    for key in config:
        try:
            filename = base64.b64decode(key)
        except (binascii.Error, ValueError):
            # not bas64
            filename = key
        else:
            if filename.lower().endswith(b'.pdf'):
                filename = filename.decode() # bytest -> str
            else:
                # unknown
                continue
        yield (filename, config[key])

data = {fn: data for (fn, data) in all_recent_files()
        if os.path.isfile(fn)}

def file_ts(fn):
    return int(data[fn].get('time') or 0)

files = list(data.keys())
files.sort(key=file_ts, reverse=True)

for fn in files:
    print(fn)
