#!/bin/bash

# Directory where your dotfiles are stored (change this to your actual dotfiles location)
DOTFILES_DIR="$PWD/dotfiles"
CONFIG_DIR="$DOTFILES_DIR/.config"

# Make sure the .config directory exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo ".config directory not found in $DOTFILES_DIR. Please ensure the path is correct."
    exit 1
fi

# Loop through the contents of the .config directory
for app_dir in "$CONFIG_DIR"/*; do
    if [ -d "$app_dir" ]; then
        app_name=$(basename "$app_dir")
        target_dir="$DOTFILES_DIR/$app_name/.config/$app_name"

        # Create the target folder structure
        echo "Creating folder structure for $app_name at $target_dir"
        mkdir -p "$target_dir"

        # Move all files inside the app directory to the new structure
        echo "Moving files from $app_dir to $target_dir"
        mv "$app_dir"/* "$target_dir"
    fi
done

echo "Restructuring complete!"
