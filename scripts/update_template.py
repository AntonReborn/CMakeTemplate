import os
import re

def replace_in_file(file_path, old_string, new_string):
    with open(file_path, 'r', encoding='utf-8') as file:
        filedata = file.read()

    # Replace the target string
    filedata = filedata.replace(old_string, new_string)

    # Write the file out again
    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(filedata)

def rename_files(root_dir, old_string, new_string):
    for dirpath, dirnames, filenames in os.walk(root_dir, topdown=True):
        # Skip hidden directories
        dirnames[:] = [d for d in dirnames if not d.startswith('.')]
        for filename in filenames:
            if old_string in filename:
                new_filename = filename.replace(old_string, new_string)
                os.rename(os.path.join(dirpath, filename), os.path.join(dirpath, new_filename))
        for dirname in dirnames:
            if old_string in dirname:
                new_dirname = dirname.replace(old_string, new_string)
                os.rename(os.path.join(dirpath, dirname), os.path.join(dirpath, new_dirname))

def main_interactive(root_dir):
    # Get user input for strings to replace
    old_lib = '__lib__'
    new_lib = input(f"Enter the new string to replace {old_lib}: ")

    old_app = '__app__'
    new_app = input(f"Enter the new string to replace {old_app}: ")

    replace_pairs = {
        old_lib: new_lib,
        old_app: new_app
    }

    for old_string, new_string in replace_pairs.items():
        # Replace in file content
        for dirpath, dirnames, filenames in os.walk(root_dir):
            for filename in filenames:
                file_path = os.path.join(dirpath, filename)
                replace_in_file(file_path, old_string, new_string)

        # Rename files and directories
        rename_files(root_dir, old_string, new_string)

if __name__ == "__main__":
    root_dir = input("Enter the path to the project: ")  # User inputs the path
    main_interactive(root_dir)