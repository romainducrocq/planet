#include <signal.h>
#include <stdlib.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap signal bindings with variadics

#ifdef BUILD_SIGNAL
static void signal_fptr(int sig) {
    extern void signal_func(int sig);
    signal_func(sig);
}

int signal_f(int sig) { return (int)signal(sig, signal_fptr) != SIG_ERR ? 0 : -1; }
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap stdlib bindings with variadics

#ifdef BUILD_AT_QUICK_EXIT
static int at_quick_exit_fptr(void) {
    extern int at_quick_exit_func(void);
    return at_quick_exit_func();
}

int at_quick_exit_f(void) { return at_quick_exit(at_quick_exit_fptr); }
#endif

#ifdef BUILD_ATEXIT
static int atexit_fptr(void) {
    extern int atexit_func(void);
    return atexit_func();
}

int atexit_f(void) { return atexit(atexit_fptr); }
#endif

#ifdef BUILD_BSEARCH
static int bsearch_fptr(const void* a, const void* b) {
    extern int bsearch_compare(const void* a, const void* b);
    return bsearch_compare(a, b);
}

void* bsearch_f(const void* key, const void* base, unsigned long nmemb, unsigned long size) {
    return bsearch(key, base, nmemb, size, bsearch_fptr);
}
#endif

#ifdef BUILD_QSORT
static int qsort_fptr(const void* a, const void* b) {
    extern int qsort_compare(const void* a, const void* b);
    return qsort_compare(a, b);
}

void qsort_f(void* base, unsigned long nmemb, unsigned long size) { qsort(base, nmemb, size, qsort_fptr); }
#endif
