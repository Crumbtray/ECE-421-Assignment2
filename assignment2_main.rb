require './shell'
require './message_timer'
require './file_watcher'
require 'fileutils'

# Main driver file for assignment 2.
# Group 4
# Members:
# Jason Morawski
# Tyler Schneider
# Chris Beckett

if(ARGV.count != 1)
	puts "Usage: ruby assignment2_main.rb [n] where n is:"
	puts "sh for Ruby Shell"
	puts "m for Message Timer"
	puts "f for File Watcher"
	exit
end

if(ARGV.first == "sh")
	# Example of our shell:
	RubyShell.start
elsif (ARGV.first == "m")
	#Demonstrations as to how to use the message timer directly, refer to message_timer_driver.rb
	#for an explanation as to how to pass the input
	MessageTimer.timedMessage("3s2ms1ns", "sampleMessageTimer")
elsif(ARGV.first == "f")
	# Demonstration for FileWatcher.
	FileWatcher.FileWatch(10, ['ruby.txt'], 0) {|file| puts "File ruby.txt has been created."}
	FileUtils.touch('ruby.txt')
	FileUtils.rm('ruby.txt')
else
	puts "Invalid argument #{ARGV.first}"
end

