module MessageTimer

	def MessageTime(time, message)
		#PRE CONDITIONS
		Arguments are correct.
		Message implements to_s.
		Time is a number. (Can be decimal)
		#END PRE CONDITIONS

		#POST CONDITIONS
		All spawned threads are dead.
		#END POST CONDITIONS

		#INVARIANT
		Input parameters are not modified.
		#END INVARIANT
	end
end