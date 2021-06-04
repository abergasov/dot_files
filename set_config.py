import os
import stat
from pathlib import Path
from os.path import isfile, join
import shutil
import json

home = str(Path.home()) + "/"
git_dir = str(Path().absolute()) + "/config/"

executable_file_list = json.load(open('executable_list.json',))

for src_dir in os.listdir(git_dir):
    if not os.path.isdir(git_dir + src_dir):
        shutil.copyfile(git_dir + src_dir, home + src_dir)
        continue
    for n_dir in os.listdir(git_dir + src_dir):
        target_dir = "{0}{1}/{2}".format(home, src_dir, n_dir)
        if os.path.exists(target_dir):
            shutil.rmtree(target_dir)
        os.makedirs(target_dir)
        s_dir = "{0}{1}/{2}".format(git_dir, src_dir, n_dir)
        for fl in [f for f in os.listdir(s_dir) if isfile(join(s_dir, f))]:
            target_file = "{0}/{1}".format(target_dir, fl)
            src_file = "{0}{1}/{2}/{3}".format(git_dir, src_dir, n_dir, fl)
            shutil.copyfile(src_file, target_file)
            if "{0}/{1}/{2}".format(src_dir, n_dir, fl) in executable_file_list:
                st = os.stat(target_file)
                os.chmod(target_file, st.st_mode | stat.S_IEXEC)
