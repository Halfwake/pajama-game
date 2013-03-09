import glob
import os
import zipfile

FILE_NAME = 'test.love'
START_DIR = os.getcwd()
print START_DIR

try:
    os.remove(FILE_NAME)
except:
    pass
git_ignore_f = open('.gitignore')
git_ignore_lines = git_ignore_f.readlines()
git_ignore_f.close()

to_archive = []
def tree_add(start_dir):
    os.chdir(start_dir)
    git_ignore = []
    for ignore in git_ignore_lines:
        git_ignore.extend(glob.glob(ignore))

    valid_names = [name for name in os.listdir(start_dir) if name not in git_ignore and name != FILE_NAME]
    for i in valid_names: print i
    
    files = [name for name in valid_names if os.path.isfile(name)]
    dirs = [name for name in valid_names if os.path.isdir(name)]

    to_archive.extend([start_dir + os.sep + name for name in files])
    for folder in dirs:
        tree_add(start_dir + os.sep + folder + os.sep)
        
tree_add(os.getcwd())

os.chdir(START_DIR)
archive = zipfile.ZipFile(FILE_NAME, mode='w')
for name in to_archive:
    print 'Writing: ', name
    archive.write(name, name[name.index('pajama-game') + len('pajama-game') + 1:])
archive.close()
print 'Finished'

