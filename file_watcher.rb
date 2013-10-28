require 'test/unit/assertions.rb'
require 'file_watcher_c'
module FileWatcher

	@filesWatched = Array.new

	def FileWatch(duration, listOfFileNames, type, &action)
		#PRE CONDITIONS
		listOfFileNames.each {|file| 
			begin
				raise ArgumentError, "FileWatcher:: ArgumentError -> file name is too large (> 255)" unless file.size <= 255
			end
		}
		child_pid = fork do
			while true
				#calls c, waits for change
				file_watcher_c.watch(listOfFileNames.size, listOfFileNames, type)
				
				#wait for duration
				#insert timer here
				
				#perform action block
				yield
			end
		end
				
		
		#END PRE CONDITIONS

		#POST CONDITIONS
		#Process spawned exists and persists.
		#END POST CONDITIONS
	
	def invariant
		assert(@filesWatched.kind_of? Array)
	end

end