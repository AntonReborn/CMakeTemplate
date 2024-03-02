#!/bin/bash

# Set LC_CTYPE to C to handle character encoding issues
export LC_CTYPE=C

# Ask the user for replacement strings
read -p "Enter the replacement string for __app__: " app_replacement
read -p "Enter the replacement string for __lib__: " lib_replacement
read -p "Enter the replacement string for __namespace__: " namespace_replacement

target_directory="."

# Function to replace in file contents, adjusting for macOS compatibility
replace_in_files() {
    local find_string=$1
    local replace_string=$2
    local directory=$3

    # macOS requires an empty string after -i to avoid backup creation
    find "$directory" -type f -not -path '*/\.*' -exec sed -i '' "s/$find_string/$replace_string/g" {} +
}

# Function to rename files, adjusted for environments without 'rename'
rename_files() {
    local find_string=$1
    local replace_string=$2
    local directory=$3

    # Use find to locate files and directories, then use a loop to rename them
    find "$directory" -depth -name "*$find_string*" | while read -r file ; do
        local dir_path=$(dirname "$file")
        local base_name=$(basename "$file")
        local new_name=$(echo "$base_name" | sed "s/$find_string/$replace_string/g")
        mv "$file" "$dir_path/$new_name"
    done
}

echo "Removing .git/ (sudo)"
sudo rm -r .git

# Perform replacements for __app__
replace_in_files "__app__" "$app_replacement" "$target_directory"
rename_files "__app__" "$app_replacement" "$target_directory"

# Perform replacements for __lib__
replace_in_files "__lib__" "$lib_replacement" "$target_directory"
rename_files "__lib__" "$lib_replacement" "$target_directory"

replace_in_files "__namespace__" "$namespace_replacement" "$target_directory"
rename_files "__namespace__" "$namespace_replacement" "$target_directory"

echo "Replacements complete."

echo "Removing init_template.sh"
rm init_template.sh

