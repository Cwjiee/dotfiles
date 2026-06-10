#!/bin/bash

export HOME=/Users/weijie
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin

cd /Users/weijie/obsidian/main || { echo "Directory not accessible;" exit 1; }

git add .
git commit -m "backup"
git push origin main
