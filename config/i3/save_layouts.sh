#!/bin/bash

mkdir -p ~/.i3

for i in $(seq 1 10); 

do echo "Saving for workspace $i"; 
#i3-save-tree --workspace $i > ~/.i3/workspace_${i}.json

done
