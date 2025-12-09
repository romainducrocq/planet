#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap errno

int get_errno(void) { return errno; }
void set_errno(int value) { errno = value; }
int get_EDOM(void) { return EDOM; }
int get_EILSEQ(void) { return EILSEQ; }
int get_ERANGE(void) { return ERANGE; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap stdio

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

// Wrap stdlib

int get_EXIT_FAILURE(void) { return EXIT_FAILURE; }
int get_EXIT_SUCCESS(void) { return EXIT_SUCCESS; }
int get_RAND_MAX(void) { return RAND_MAX; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap time

unsigned long get_CLOCKS_PER_SEC(void) { return CLOCKS_PER_SEC; }
unsigned long get_TIME_UTC(void) { return TIME_UTC; }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap printf variadics

static char* sfmt = NULL;

static void sfmt_free(void) {
    if (sfmt) {
        free(sfmt);
        sfmt = NULL;
    }
}

static int sfmt_alloc(size_t size) {
    sfmt_free();
    sfmt = (char*)malloc(size * sizeof(char));
    return (sfmt != NULL);
}

const char* fmt1(const char* s1) {
    size_t size = 1;
    size += strlen(s1);
    if (sfmt_alloc(size)) {
        snprintf(sfmt, size, "%s", s1);
        sfmt[size - 1] = '\0'; // TODO rm here ? and all next occurences
    }
    return sfmt;
}

const char* fmt2(const char* s1, const char* s2) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    if (sfmt_alloc(size)) {
        snprintf(sfmt, size, "%s%s", s1, s2);
        sfmt[size - 1] = '\0';
    }
    return sfmt;
}

const char* fmt3(const char* s1, const char* s2, const char* s3) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    if (sfmt_alloc(size)) {
        snprintf(sfmt, size, "%s%s%s", s1, s2, s3);
        sfmt[size - 1] = '\0';
    }
    return sfmt;
}

const char* fmt4(const char* s1, const char* s2, const char* s3, const char* s4) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    size += strlen(s4);
    if (sfmt_alloc(size)) {
        snprintf(sfmt, size, "%s%s%s%s", s1, s2, s3, s4);
        sfmt[size - 1] = '\0';
    }
    return sfmt;
}

const char* fmt5(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    size += strlen(s4);
    size += strlen(s5);
    if (sfmt_alloc(size)) {
        snprintf(sfmt, size, "%s%s%s%s%s", s1, s2, s3, s4, s5);
        sfmt[size - 1] = '\0';
    }
    return sfmt;
}

const char* fmt6(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    size += strlen(s4);
    size += strlen(s5);
    size += strlen(s6);
    if (sfmt_alloc(size)) {
        snprintf(sfmt, size, "%s%s%s%s%s%s", s1, s2, s3, s4, s5, s6);
        sfmt[size - 1] = '\0';
    }
    return sfmt;
}

const char* fmt7(
    const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6, const char* s7) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    size += strlen(s4);
    size += strlen(s5);
    size += strlen(s6);
    size += strlen(s7);
    if (sfmt_alloc(size)) {
        snprintf(sfmt, size, "%s%s%s%s%s%s%s", s1, s2, s3, s4, s5, s6, s7);
        sfmt[size - 1] = '\0';
    }
    return sfmt;
}

const char* fmt8(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6,
    const char* s7, const char* s8) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    size += strlen(s4);
    size += strlen(s5);
    size += strlen(s6);
    size += strlen(s7);
    size += strlen(s8);
    if (sfmt_alloc(size)) {
        snprintf(sfmt, size, "%s%s%s%s%s%s%s%s", s1, s2, s3, s4, s5, s6, s7, s8);
        sfmt[size - 1] = '\0';
    }
    return sfmt;
}

const char* fmt9(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6,
    const char* s7, const char* s8, const char* s9) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    size += strlen(s4);
    size += strlen(s5);
    size += strlen(s6);
    size += strlen(s7);
    size += strlen(s8);
    size += strlen(s9);
    if (sfmt_alloc(size)) {
        snprintf(sfmt, size, "%s%s%s%s%s%s%s%s%s", s1, s2, s3, s4, s5, s6, s7, s8, s9);
        sfmt[size - 1] = '\0';
    }
    return sfmt;
}

const char* fmt10(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6,
    const char* s7, const char* s8, const char* s9, const char* s10) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    size += strlen(s4);
    size += strlen(s5);
    size += strlen(s6);
    size += strlen(s7);
    size += strlen(s8);
    size += strlen(s9);
    size += strlen(s10);
    if (sfmt_alloc(size)) {
        snprintf(sfmt, size, "%s%s%s%s%s%s%s%s%s%s", s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);
        sfmt[size - 1] = '\0';
    }
    return sfmt;
}

int print(const char* format) {
    if (!format) {
        return -1;
    }
    int num = printf(format);
    sfmt_free();
    return num;
}
