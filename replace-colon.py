# Simple script to replace file names with colons in them
#

import os

def list_files(directory, chars):
    files = []
    for item in os.listdir(directory):
        if item.find(chars) >= 0:
            if os.path.isfile(item):
                files.append(item)
                #print(f"File: {item}")
            elif os.path.isdir(item):
                print(f"Skipped Directory: {item}")
    return files

def rename_files(files, badchars, newchars):
    for file in files:
        new_file = file.replace(badchars, newchars)
        print(f"{file} => {new_file}")
        os.rename(file, new_file)


# specify the directory you want to list files from
directory = '.'

#files = list_files(directory, ":")
#rename_files(files, ":", " -- ")

#files = list_files(directory, " -- ")
#rename_files(files, " -- ", ",")

#files = list_files(directory, "**")
#rename_files(files, "**", "")

#files = list_files(directory, '"')
#rename_files(files, '"', "")

#files = list_files(directory, ',')
#rename_files(files, ',', "")

files = list_files(directory, '?')
rename_files(files, '?', "")
