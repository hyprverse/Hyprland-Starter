#!/bin/bash

# Source the library with the _installPackages function
source ~/Hyprland-Starter/.library/library.sh

# Get the absolute path of the script's directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Script directory: $SCRIPT_DIR"

# Function to select GPU drivers for a single brand
selectGPUDrivers() {
    question="Which GPU Driver do you want to install?"
    options=("amd" "intel" "nvidia")
    selected_brand=$(gum choose "${options[@]}")
    echo "$selected_brand"
}

# Function to install GPU drivers for the selected brand
installGPUDrivers() {
    local selected_brand=$1
    local file_path="$SCRIPT_DIR/${selected_brand}.txt"
    echo "$file_path"

    if [ -f "$file_path" ]; then
        _installPackages "$file_path" || echo "ERROR: Failed to install GPU drivers for $selected_brand"
    else
        echo "ERROR: Invalid file path for $selected_brand"
    fi
}

# Example usage:
while true; do
    selected_brand=$(selectGPUDrivers)
    installGPUDrivers "$selected_brand"

    # Ask if the user wants to install drivers for another GPU brand
    gum confirm "Do you want to install drivers for another GPU brand?" || break
done

