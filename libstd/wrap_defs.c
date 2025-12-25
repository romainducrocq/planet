#include <assert.h>
#include <errno.h>
#include <locale.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap assert defines

static int ndebug = 1;

void set_ndebug(void) { ndebug = 0; }
void set_assert(int expression) {
#ifdef NDEBUG
#undef NDEBUG
#endif
    assert(ndebug && expression);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap errno defines

int get_errno(void) { return errno; }
void set_errno(int value) { errno = value; }
int get_EDOM(void) { return EDOM; }
int get_EILSEQ(void) { return EILSEQ; }
int get_ERANGE(void) { return ERANGE; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap locale defines

int get_LC_ALL(void) { return LC_ALL; }
int get_LC_COLLATE(void) { return LC_COLLATE; }
int get_LC_CTYPE(void) { return LC_CTYPE; }
int get_LC_MONETARY(void) { return LC_MONETARY; }
int get_LC_NUMERIC(void) { return LC_NUMERIC; }
int get_LC_TIME(void) { return LC_TIME; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap signal defines

int get_SIGABRT(void) { return SIGABRT; }
int get_SIGFPE(void) { return SIGFPE; }
int get_SIGILL(void) { return SIGILL; }
int get_SIGINT(void) { return SIGINT; }
int get_SIGSEGV(void) { return SIGSEGV; }
int get_SIGTERM(void) { return SIGTERM; }
int signal_dfl(int sig) { return signal(sig, SIG_DFL) != SIG_ERR ? 0 : -1; }
int signal_ign(int sig) { return signal(sig, SIG_IGN) != SIG_ERR ? 0 : -1; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap stdio defines

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

// Wrap stdlib defines

int get_EXIT_FAILURE(void) { return EXIT_FAILURE; }
int get_EXIT_SUCCESS(void) { return EXIT_SUCCESS; }
int get_RAND_MAX(void) { return RAND_MAX; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap time defines

unsigned long get_CLOCKS_PER_SEC(void) { return CLOCKS_PER_SEC; }
unsigned long get_TIME_UTC(void) { return TIME_UTC; }
