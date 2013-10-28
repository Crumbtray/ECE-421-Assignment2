#include "ctimer.h"
#include <time.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <stdbool.h>

/*
 * startTimer
 *
 * Implements a timer accurate down to the nanosecond
 * 
 * Paramters:
 *    s - number of seconds to delay for
 *    ms - number of milliseconds to delay for
 *    ns - number of nanoseconds to delay for
 *
 * Return value
 *    true - succes, false else
 */
bool start(int s, int ms, int ns) {
  struct timespec delay;

  //Load timer
  delay.tv_sec = s + ms / 1000;
  delay.tv_nsec = ms * 1000 + ns;

  //Start timer
  if(nanosleep(&delay, NULL) == 0)
    {
      return true;
    }

  return false;
}
