require './shell'
require 'getoptlong'

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
else
	puts "Invalid argument #{ARGV.first}"
end