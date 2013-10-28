# Driver file for message_timer.
require './message_timer'


if(ARGV.length != 2)
	puts "Missing arguments. Usage: message_timer_driver TIME MESSAGE"
	puts "TIME - Time in the format '<xx>hr<xx>m<xx>s<xxx>ms<xxx>ns'\n Note: not all time resolutions are required.  ex: '4m211ms' is acceptable"
	puts "MESSAGE - The message to display after NMSEC milliseconds"
	exit 0
end

MessageTimer.timedMessage(ARGV.shift, ARGV.shift)