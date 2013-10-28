# Driver file for message_timer.
require './message_timer'


if(ARGV.length != 2)
	puts "Missing arguments. Usage: message_timer_driver NMSEC MESSAGE"
	puts "NMSEC - Time in milliseconds"
	puts "MESSAGE - The message to display after NMSEC milliseconds"
	exit 0
end

MessageTimer.timedMessage(ARGV.shift, ARGV.shift)