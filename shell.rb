# Well, fork() isn't implemented on Windows machines.  Great.

$stdin.each_line do |line|
	pid = fork {
		exec line
	}

	Process.wait pid
end