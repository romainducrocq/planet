#include <errno.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap errno consts

int get_errno(void) { return errno; }
void set_errno(int value) { errno = value; }
int get_EDOM(void) { return EDOM; }
int get_EILSEQ(void) { return EILSEQ; }
int get_ERANGE(void) { return ERANGE; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap locale consts

int get_LC_ALL(void) { return LC_ALL; }
int get_LC_COLLATE(void) { return LC_COLLATE; }
int get_LC_CTYPE(void) { return LC_CTYPE; }
int get_LC_MONETARY(void) { return LC_MONETARY; }
int get_LC_NUMERIC(void) { return LC_NUMERIC; }
int get_LC_TIME(void) { return LC_TIME; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap stdio consts

int get__IOFBF(void) { return _IOFBF; }
int get__IOLBF(void) { return _IOLBF; }
int get__IONBF(void) { return _IONBF; }
unsigned long get_BUFSIZ(void) { return BUFSIZ; }
int get_EOF(void) { return EOF; }
int get_FOPEN_MAX(void) { return FOPEN_MAX; }
int get_FILENAME_MAX(void) { return FILENAME_MAX; }
int get_L_tmpnam(void) { return L_tmpnam; }
int get_SEEK_CUR(void) { return SEEK_CUR; }
int get_SEEK_END(void) { return SEEK_END; }
int get_SEEK_SET(void) { return SEEK_SET; }
int get_TMP_MAX(void) { return TMP_MAX; }
FILE* get_stderr(void) { return stderr; }
FILE* get_stdin(void) { return stdin; }
FILE* get_stdout(void) { return stdout; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap stdlib consts

int get_EXIT_FAILURE(void) { return EXIT_FAILURE; }
int get_EXIT_SUCCESS(void) { return EXIT_SUCCESS; }
int get_RAND_MAX(void) { return RAND_MAX; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap time consts

unsigned long get_CLOCKS_PER_SEC(void) { return CLOCKS_PER_SEC; }
unsigned long get_TIME_UTC(void) { return TIME_UTC; }
