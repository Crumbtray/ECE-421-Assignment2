# Driver file for file watcher.

require './file_watcher'
require 'fileutils'

FileWatcher.FileWatch(10, ['ruby.txt'], 0) {puts "FACK"}
FileUtils.touch('ruby.txt')
FileUtils.rm('ruby.txt')