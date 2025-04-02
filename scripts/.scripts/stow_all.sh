#!/bin/bash

# Assuming you are in the directory where your dotfiles are stored
DOTFILES_DIR="$PWD"

# Loop through all subdirectories in the current directory (except the ones you don’t want to stow)
for app_dir in */; do
    # Skip if it's a hidden directory (like .git, etc.)
    if [[ "$app_dir" =~ ^\..* ]]; then
        continue
    fi

    # Run stow on each directory
    echo "Stowing $app_dir"
    stow "$app_dir"
done

echo "Stowing complete!"
