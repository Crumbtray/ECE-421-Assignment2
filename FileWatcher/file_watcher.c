#include <sys/inotify.h>
#include <stdio.h>
#include <stdlib.h>
#include <libgen.h>
#include <string.h>
#include <unistd.h>

void error_exit(const char* message);

#define EVENT_SIZE (sizeof(struct inotify_event))
#define EVENT_BUF_LEN (1024*(EVENT_SIZE+16))
#define MAX_STRING_LEN 255

int watch(int argc, char* argv[], int mode)
{
	int fd;
	char buffer[EVENT_BUF_LEN];
	int mask = 0;
	
	if (mode == 0)
		mask = IN_CREATE;
	else if (mode == 1)
		mask = IN_MODIFY || IN_ATTRIB || IN_MOVE;
	else if (mode == 2)
		mask = IN_DELETE;
	else
		error_exit("invalid mode specified");
	
	fd = inotify_init();
	int wd[argc];
	
	if (fd < 0)
		error_exit("inotify_init failed");
	
	int i;
	
	for (i = 0; i < argc; ++i)
	{
		if (mode == 0)
			wd[i] = inotify_add_watch(fd, dirname(argv[i]), mask);
		else
			wd[i] = inotify_add_watch(fd, argv[i], mask);
	}
	
	int length;
	
	while (1)
	{
		length = read(fd, buffer, EVENT_BUF_LEN);
		
		if (length < 0)
			error_exit("read failed");
		
		i = 0;
		while (i < length)
		{
			struct inotify_event *e = (struct inotify_event*) &buffer[i];
			if (e->mask & IN_CREATE)
			{
				int j;
				for (j=0; j < argc; ++j)
				{
					if (e->wd == wd[i])
					{
						return 1;
					}
				}
			}
			else if (e->mask & IN_MODIFY || e->mask & IN_MOVE || e->mask & IN_DELETE)
			{
				return 1;
			}
			i++;
		}
	}
}

void error_exit(const char* message)
{
	printf("Error: %s.\n", message);
	exit(0);
}
