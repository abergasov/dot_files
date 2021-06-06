import os
from pathlib import Path
import subprocess as cmd
import shutil
import json

home = str(Path.home()) + "/"
git_dir = str(Path().absolute()) + "/config/"
if os.path.exists(git_dir):
    shutil.rmtree(git_dir)
executable_files = []


target_data = [".config/i3", ".config/i3blocks", ".config/i3status", ".config/dunst", ".zshrc"]
for i in target_data:
    src_path = home + i
    target_path = git_dir + i
    if not os.path.isdir(src_path):
        shutil.copyfile(src_path, target_path)
        continue

    if os.path.exists(target_path):
        shutil.rmtree(target_path)
    shutil.copytree(src_path, target_path)


for root, dirs, files in os.walk(git_dir):
    for file in files:
        path = (root + os.sep + file).replace("//", "/")
        if os.access(path, os.X_OK):
            executable_files.append(path.replace(git_dir, ""))


with open("executable_list.json", "w") as outfile:
    outfile.write(json.dumps(executable_files, indent=4))

cmd.run("git add .", check=True, shell=True)
cmd.run("git commit -m 'config update'", check=True, shell=True)
cmd.run("git push origin master", check=True, shell=True)
