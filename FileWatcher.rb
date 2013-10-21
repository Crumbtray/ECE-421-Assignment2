require 'test/unit/assertions.rb'

module FileWatcher

	@filesWatched = Array.new

	def FileWatchCreation(duration, listOfFileNames)
		#PRE CONDITIONS
		listOfFileNames.each {|file| 
			begin
				raise ArgumentError, "FileWatcher:: ArgumentError -> file name is too large (> 255)" unless file.size <= 255
			end
		}
		#END PRE CONDITIONS

		#POST CONDITIONS
		#Process spawned exists and persists.
		#END POST CONDITIONS
	end

	def FileWatchAlter(duration, listOfFileNames)
		#PRE CONDITIONS
		listOfFileNames.each {|file| 
			begin
				raise ArgumentError, "FileWatcher:: ArgumentError -> file name is too large (> 255)" unless file.size <= 255
			end
		}
		#END PRE CONDITIONS

		#POST CONDITIONS
		#Process spawned exists and persists.
		#END POST CONDITIONS
	end

	def FileWatchDestroy(duration, listOfFileNames)
		#PRE CONDITIONS
		listOfFileNames.each {|file| 
			begin
				raise ArgumentError, "FileWatcher:: ArgumentError -> file name is too large (> 255)" unless file.size <= 255
			end
		}
		#END PRE CONDITIONS

		#POST CONDITIONS
		#Process spawned exists and persists.
		#END POST CONDITIONS
	end

	def invariant
		assert(@filesWatched.kind_of? Array)
	end

end