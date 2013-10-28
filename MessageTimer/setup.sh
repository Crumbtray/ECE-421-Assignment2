#/bin/bash

swig -ruby ctimer.i
ruby extconf.rb
make
rm -f *.o ctimer_wrap.c Makefile