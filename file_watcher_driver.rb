# Driver file for file watcher.

require './file_watcher'
require 'fileutils'

# File Watcher usage:
# FileWatcher.FileWatch(NMSEC, ListOfFiles, AlterationType) {BLOCK}
# Where:
# NMSEC - Number of milliseconds to delay
# ListOfFiles - List of files to watch
# AlterationType - Type of alteration to look for:
# 	0 - Creation
# 	1 - Modification
# 	2 - Deletion
# BLOCK - a block of actions to perform when the watcher activates
FileWatcher.FileWatch(10, ['ruby.txt'], 0) {puts "File ruby.txt created."}
FileUtils.touch('ruby.txt')
FileUtils.rm('ruby.txt')