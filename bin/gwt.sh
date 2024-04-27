#!/bin/bash

set -e
set -u

read -p "Enter the branch name (ex: ruansilva/s3): " branch
read -p "Enter folder name: " folder

# Add worktree
git worktree add -b "ruansilva/$branch" "$folder"

# Navigate to the worktree
cd "$folder"

# Set the HEAD main
git fetch
git pull origin main

# Create a new split
tmux splitw -h

tmux swap-pane -D

tmux resize-pane -R 15

# Install dependencies
npm install

# Run setup
npm run setup

cd "$folder"

# TODO make the script execute on the split
