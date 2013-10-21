require 'test/unit/assertions.rb'

module MessageTimer

	def MessageTime(time, message)
		#PRE CONDITIONS
		# None, everything should respond to .to_s,
		# and we simply pass the numbers along.
		#END PRE CONDITIONS

		originalTime = time
		originalMessage = message

		#POST CONDITIONS
		#All spawned threads are dead.
		assert(Thread.list.select {|thread| thread.status == "run"}.count < 1)
		#END POST CONDITIONS

		#INVARIANT
		#Input parameters are not modified.
		assert_equal(originalTime, time)
		assert_equal(originalMessage, message)
		#END INVARIANT
	end
end