# Well, fork() isn't implemented on Windows machines.  Great.
require 'shellwords'
require 'test/unit/assertions.rb'
include Test::Unit::Assertions

module RubyShell
	BUILTINS = {
		'cd' => lambda{|dir| 
			begin
				Dir.chdir(dir)
			rescue Errno::ENOENT
				puts "cd: no directory with that name"
			end	},
		'exit' => lambda{ |code = 0| exit(code.to_i)},
		'exec' => lambda{ |*command| exec *command }
	}
	
	def self.start

		#PRE CONDITIONS
		# No Preconditions.
		#END PRE CONDITIONS

		loop do
			$stdout.print '-> '
			begin
				line = $stdin.gets.strip

				command, *arguments = Shellwords.shellsplit(line)

				if BUILTINS[command]
					begin
						BUILTINS[command].call(*arguments)
					rescue ArgumentError
						puts command + ": wrong number of arguments"
					end
				elsif command.nil?
				else
					pid = fork {
						begin
							exec line
						rescue SystemCallError
							puts "RubyShell: " + command + ": command not found"						
						end
					}
					Process.wait pid
				end

			rescue Interrupt
				puts ""
			end
		end

		#POST CONDITIONS
		# Child thread is dead.
		assert(Thread.list.select {|thread| thread.status == "run"}.count <= 1, "Threads running is greater than 1")
		#END POST CONDITIONS
	end

	#INVARIANT
	def invariant
		assert(Thread.list.select {|thread| thread.status == "run"}.count < 3)
	end
	#END INVARIANT
end