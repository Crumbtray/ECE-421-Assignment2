# Driver file for message_timer.
require './message_timer'


if(ARGV.length != 2)
	puts "Missing arguments. Try --help for more information."
	exit 0
end

MessageTimer.timedMessage(ARGV.shift, ARGV.shift)