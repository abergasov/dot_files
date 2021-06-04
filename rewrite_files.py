import os
from os.path import isfile, join
from pathlib import Path
import subprocess as cmd
import shutil
import json

home = str(Path.home()) + "/"
git_dir = str(Path().absolute()) + "/config/"
if os.path.exists(git_dir):
    shutil.rmtree(git_dir)
executable_files = []


def copy_file(path_src: str, path_target: str) -> bool:
    shutil.copyfile(path_src, path_target)
    return os.access(path_src, os.X_OK)


target_data = [".config/i3", ".config/i3blocks", ".config/i3status", ".config/dunst", ".zshrc"]
for i in target_data:
    src_path = home + i
    target_path = git_dir + i
    if os.path.isdir(src_path):
        Path(target_path).mkdir(parents=True, exist_ok=True)
    else:
        if copy_file(src_path, target_path) is True:
            executable_files.append(i)
        continue

    for f in [f for f in os.listdir(src_path) if isfile(join(src_path, f))]:
        src_file = '{0}/{1}'.format(src_path, f)
        if os.access(src_file, os.X_OK):
            executable_files.append("{0}/{1}".format(i, f))
        shutil.copyfile(src_file, '{0}/{1}'.format(target_path, f))

with open("executable_list.json", "w") as outfile:
    outfile.write(json.dumps(executable_files, indent=4))

cmd.run("git add .", check=True, shell=True)
cmd.run("git commit -m '1'", check=True, shell=True)
cmd.run("git push -u origin master", check=True, shell=True)
