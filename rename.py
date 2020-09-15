import numpy as np
import os
import sys

# Create new directory data/ to store relabelled files
new_path = "data"
if new_path in os.listdir():
	sys.exit("ERROR: Specified path already exists")
else:
	new_path = new_path + "/"
	os.mkdir(new_path)

# Iterate through folders and relabel
print("Relabelling files...")
count = 0
for path in next(os.walk('.'))[1]:
	path = path + "/"
	for filename in os.listdir(path):
		ext = os.path.splitext(filename)[1]
		new_name = new_path + (str(count) + ext).zfill(9)
		os.rename(path + filename, new_name)
		count += 1

print("Done!\nCreated " + str(count) + " new files")