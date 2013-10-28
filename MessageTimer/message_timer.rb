require 'test/unit/assertions.rb'
require './ctimer'

module MessageTimer

	def self.timedMessage(time, message)
		#PRE CONDITIONS
		# None, everything should respond to .to_s,
		# and we simply pass the numbers along.
		#END PRE CONDITIONS

		originalTime = time
		originalMessage = message

		#Parse the arguments (get the matching substring, remove non-numbers from substring, convert substring to integer)
		hrs = (/[0-9]{1,2}h/.match(time)).to_s.tr('^0-9', '').to_i
		min = (/[0-9]{1,2}m/.match(time)).to_s.tr('^0-9', '').to_i
		sec = (/[0-9]{1,2}s/.match(time)).to_s.tr('^0-9', '').to_i
		msec = (/[0-9]{1,3}ms/.match(time)).to_s.tr('^0-9', '').to_i
		nsec = (/[0-9]{1,3}ns/.match(time)).to_s.tr('^0-9', '').to_i

		#Get total seconds
		totalSeconds = hrs*3600 + min*60 + sec

		#Start the C timer
		Ctimer.start(totalSeconds, msec, nsec)
		
		#Print the message
		puts message
		
		#POST CONDITIONS
		#All spawned threads are dead.
		#assert(Thread.list.select {|thread| thread.status == "run"}.count < 1)
		#END POST CONDITIONS

		#INVARIANT
		#Input parameters are not modified.
		#assert_equal(originalTime, time)
		#assert_equal(originalMessage, message)
		#END INVARIANT
	end
	
end