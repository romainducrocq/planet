#include <stdlib.h>

int get_EXIT_FAILURE(void) { return EXIT_FAILURE; }
int get_EXIT_SUCCESS(void) { return EXIT_SUCCESS; }
int get_RAND_MAX(void) { return RAND_MAX; }

static int bsearch_fptr(const void* a, const void* b) {
    extern int bsearch_compare(const void* a, const void* b);
    return bsearch_compare(a, b);
}

static int qsort_fptr(const void* a, const void* b) {
    extern int qsort_compare(const void* a, const void* b);
    return qsort_compare(a, b);
}

void* bsearch_f(void* key, void* base, unsigned long nmemb, unsigned long size) {
    return bsearch(key, base, nmemb, size, bsearch_fptr);
}

void qsort_f(void* base, unsigned long nmemb, unsigned long size) { qsort(base, nmemb, size, qsort_fptr); }
