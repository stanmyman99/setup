# Simple script to replace file names with colons in them
#

import os

def list_files(directory):
    for item in os.listdir(directory):
        item_path = os.path.join(directory, item)
        if os.path.isfile(item_path):
            print(f"File: {item}")
        elif os.path.isdir(item_path):
            print(f"Directory: {item}")

# specify the directory you want to list files from
directory = '.'

list_files(directory)

