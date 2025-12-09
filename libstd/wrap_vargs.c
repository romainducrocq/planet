#include <stdio.h>
#include <stdlib.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap stdio variadics

static char* sfmt = NULL;

static void sfmt_free(void) {
    if (sfmt) {
        free(sfmt);
        sfmt = NULL;
    }
}

#define SFMT_FUNC(X, F) \
    do {                \
        if (!X) {       \
            return -1;  \
        }               \
        int _num = F;   \
        sfmt_free();    \
        return _num;    \
    }                   \
    while (0)

int fprint(FILE* stream, const char* format) { SFMT_FUNC(format, fprintf(stream, format)); }
int fscan(FILE* stream, void* valptr, const char* format) { SFMT_FUNC(format, fscanf(stream, format, valptr)); }
int print(const char* format) { SFMT_FUNC(format, printf(format)); }
int scan(void* valptr, const char* format) { SFMT_FUNC(format, scanf(format, valptr)); }
int snprint(char* s, unsigned long n, const char* format) { SFMT_FUNC(format, snprintf(s, n, format)); }
int sprint(char* s, const char* format) { SFMT_FUNC(format, sprintf(s, format)); }
int sscan(char* s, void* valptr, const char* format) { SFMT_FUNC(format, sscanf(s, format, valptr)); }

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
