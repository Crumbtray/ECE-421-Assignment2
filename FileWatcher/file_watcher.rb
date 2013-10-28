require 'test/unit/assertions.rb'
require './file_watcher_c'
require '../MessageTimer/ctimer'

module FileWatcher

	@filesWatched = Array.new

	def self.FileWatch(duration, listOfFileNames, mode, &action)
		#PRE CONDITIONS
		listOfFileNames.each {|file| 
			begin
				raise ArgumentError, "FileWatcher:: ArgumentError -> file name is too large (> 255)" unless file.size <= 255
			end
		}
		child_pid = fork do
			while true
				#calls c, waits for change
				File_watcher_c.watch(listOfFileNames, mode)
				
				#wait for duration
				Ctimer.start((duration/1000).round,(duration%1000).round,(duration%1*1000).round)
				
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

end
