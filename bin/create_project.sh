#!/bin/sh

echo -n "project name: "
read project_name

cd ~/Documents/obsidian/main
directories=$(ls -d */)

for $directory in $directories; do
  echo $(directory)
done
