import os
from os.path import isfile, join
from pathlib import Path
import shutil
import json


home = str(Path.home()) + "/.config/"
git_dir = str(Path().absolute()) + "/config/"
if os.path.exists(git_dir):
    shutil.rmtree(git_dir)
executable_files = []

target_dirs = ["i3", "i3blocks", "i3status"]
for i in target_dirs:
    src_path = home + i
    target_path = git_dir + i
    Path(target_path).mkdir(parents=True, exist_ok=True)
    for f in [f for f in os.listdir(src_path) if isfile(join(src_path, f))]:
        src_file = '{0}/{1}'.format(src_path, f)
        if os.access(src_file, os.X_OK):
            executable_files.append("{0}/{1}".format(i, f))
        shutil.copyfile(src_file, '{0}/{1}'.format(target_path, f))
        status = os.stat(src_file)

with open("executable_list.json", "w") as outfile:
    outfile.write(json.dumps(executable_files, indent=4))
