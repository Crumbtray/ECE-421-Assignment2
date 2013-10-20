module FileWatcher
	def FileWatchCreation(duration, ListOfFileNames)
		#PRE CONDITIONS
		Filename implements to_s
		Filename cannot be larger than 255 characters.
		Time duration is a number.  (Can be decimal)
		#END PRE CONDITIONS

		#POST CONDITIONS
		Process spawned exists and persists.
		#END POST CONDITIONS
	end

	def FileWatchAlter(duration, ListOfFileNames)
		#PRE CONDITIONS
		Filename implements to_s
		Filename cannot be larger than 255 characters.
		Time duration is a number.  (Can be decimal)
		#END PRE CONDITIONS

		#POST CONDITIONS
		Process spawned exists and persists.
		#END POST CONDITIONS
	end

	def FileWatchDestroy(duration, ListOfFileNames)
		#PRE CONDITIONS
		Filename implements to_s
		Filename cannot be larger than 255 characters.
		Time duration is a number.  (Can be decimal)
		#END PRE CONDITIONS

		#POST CONDITIONS
		Process spawned exists and persists.
		#END POST CONDITIONS
	end


	#INVARIANT
	Input parameters are not modified.
	#END INVARIANT

end