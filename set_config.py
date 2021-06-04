import os
import stat
from pathlib import Path
from os.path import isfile, join
import shutil
import json

home = str(Path.home()) + "/.config/"
git_dir = str(Path().absolute()) + "/config/"

executable_file_list = json.load(open('executable_list.json',))

for src_dir in os.listdir(git_dir):
    block_dir = git_dir + src_dir
    target_dir = home + src_dir
    if os.path.exists(target_dir):
        shutil.rmtree(target_dir)
    os.makedirs(target_dir)
    for fl in [f for f in os.listdir(block_dir) if isfile(join(block_dir, f))]:
        src_file = block_dir + "/" + fl
        target_file = target_dir + "/" + fl
        shutil.copyfile(src_file, target_file)
        if "{0}/{1}".format(src_dir, fl) in executable_file_list:
            st = os.stat(target_file)
            os.chmod(target_file, st.st_mode | stat.S_IEXEC)


