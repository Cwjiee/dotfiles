#!/bin/sh

TARGET_DIRS=(
    "bat"
    "btop"
    "borders"
    "fastfetch"
    "gh"
    "git"
    "lazygit"
    "tmux/tmux.conf"
    "wezterm"
    "yazi"
    "nvim"
)

CONFIG="/usr/bin/git --git-dir=/Users/weijie/.cfg/ --work-tree=/Users/weijie"

echo "Starting 'config add' script for selected directories..."
echo "--------------------------------------------------------"

for dir_name in "${TARGET_DIRS[@]}"; do
    echo "Running: config add ${dir_name}"
    
    ${CONFIG} add "${dir_name}"
    
    if [ $? -ne 0 ]; then
        echo "ERROR: 'config add ${dir_name}' failed."
    fi
done

echo "--------------------------------------------------------"
echo "Script finished."
