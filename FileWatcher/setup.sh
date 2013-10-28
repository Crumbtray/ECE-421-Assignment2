#!/bin/bash

swig -ruby file_watcher_c.i
ruby extconf.rb
make
rm -f *.o file_watcher_c_wrap.c Makefile
