# Well, fork() isn't implemented on Windows machines.  Great.
require 'shellwords'
require 'test/unit/assertions.rb'

module RubyShell
	BUILTINS = {
		'cd' => lambda{|dir| Dir.chdir(dir)},
		'exit' => lambda{ |code = 0| exit(code.to_i)},
		'exec' => lambda{ |*command| exec *command }
	}
	#PRE CONDITIONS
	# No Preconditions.
	#END PRE CONDITIONS

	loop do
		$stdout.print '-> '
		line = $stdin.gets.strip
		command, *arguments = Shellwords.shellsplit(line)

		if BUILTINS[command]
			BUILTINS[command].call(*arguments)
		else
			pid = fork {
				exec line
			}
			Process.wait pid
		end
	end

	#POST CONDITIONS
	# Child thread is dead.
	assert(Thread.list.select {|thread| thread.status == "run"}.count < 1)
	#END POST CONDITIONS

	#INVARIANT
	assert(Thread.list.select {|thread| thread.status == "run"}.count < 3)
	#END INVARIANT
end