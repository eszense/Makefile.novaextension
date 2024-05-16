#!/usr/bin/env python3
import json, subprocess

subprocess.check_call(('git', 'stash'))
try:
  with open("extension.json", "r+") as f:
    j=json.load(f)
    v="%.1f" % (float(j["version"])+0.1)
    j["version"]=v
    f.seek(0)
    json.dump(j, f)
    f.truncate()
  subprocess.check_call(('git', 'add', 'extension.json'));
  subprocess.check_call(('git', 'commit', '-m', f'Version bump to {v}'))
except:
  subprocess.check_call(('git', 'reset', '--hard'))
  raise
finally:
  subprocess.check_call(('git', 'stash', 'pop'))
