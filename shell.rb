# Well, fork() isn't implemented on Windows machines.  Great.
require 'shellwords'

module RubyShell
	BUILTINS = {
		'cd' => lambda{|dir| Dir.chdir(dir)},
		'exit' => lambda{ |code = 0| exit(code.to_i)},
		'exec' => lambda{ |*command| exec *command }
	}
	#PRE CONDITIONS
	No Preconditions.
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
	Child thread is dead.
	#END POST CONDITIONS

	#INVARIANT
	Maximum number of threads at any time is 2
	#END INVARIANT
end