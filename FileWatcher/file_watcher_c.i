%module file_watcher_c

/*
 * Tells SWIG to treat char ** as a special case.
 */
%typemap(in) (int argc, char **argv) {

 /* Get the length of the array */
	int size = RARRAY_LEN($input); 
	int i;
	$1 = ($1_ltype) size;
	$2 = (char **) malloc((size+1)*sizeof(char *));

	/* Get the first element in memory */
	VALUE *ptr = RARRAY_PTR($input); 
	for (i=0; i < size; i++, ptr++)

	/* Convert Ruby Object String to char* */
	$2[i]= StringValuePtr(*ptr); 
	$2[i]=NULL; /* End of list */
}

/*
 * Cleans up the char ** array created before 
 * the function call.
 */
%typemap(freearg) char ** {
	free((char *) $1);
}

extern int watch(int argc, char** argv, int mode);