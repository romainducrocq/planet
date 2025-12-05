
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

static char* fmt = NULL;

static void fmt_free(void) {
    if (fmt) {
        free(fmt);
        fmt = NULL;
    }
}

static int fmt_alloc(size_t size) {
    fmt_free();
    fmt = (char*)malloc(size * sizeof(char));
    return (fmt != NULL);
}

const char* fmt1(const char* s1) {
    size_t size = 1;
    size += strlen(s1);
    if (fmt_alloc(size)) {
        snprintf(fmt, size, "%s", s1);
        fmt[size - 1] = '\0';
    }
    return fmt;
}

const char* fmt2(const char* s1, const char* s2) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    if (fmt_alloc(size)) {
        snprintf(fmt, size, "%s%s", s1, s2);
        fmt[size - 1] = '\0';
    }
    return fmt;
}

const char* fmt3(const char* s1, const char* s2, const char* s3) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    if (fmt_alloc(size)) {
        snprintf(fmt, size, "%s%s%s", s1, s2, s3);
        fmt[size - 1] = '\0';
    }
    return fmt;
}

const char* fmt4(const char* s1, const char* s2, const char* s3, const char* s4) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    size += strlen(s4);
    if (fmt_alloc(size)) {
        snprintf(fmt, size, "%s%s%s%s", s1, s2, s3, s4);
        fmt[size - 1] = '\0';
    }
    return fmt;
}

const char* fmt5(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    size += strlen(s4);
    size += strlen(s5);
    if (fmt_alloc(size)) {
        snprintf(fmt, size, "%s%s%s%s%s", s1, s2, s3, s4, s5);
        fmt[size - 1] = '\0';
    }
    return fmt;
}

const char* fmt6(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6) {
    size_t size = 1;
    size += strlen(s1);
    size += strlen(s2);
    size += strlen(s3);
    size += strlen(s4);
    size += strlen(s5);
    size += strlen(s6);
    if (fmt_alloc(size)) {
        snprintf(fmt, size, "%s%s%s%s%s%s", s1, s2, s3, s4, s5, s6);
        fmt[size - 1] = '\0';
    }
    return fmt;
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
    if (fmt_alloc(size)) {
        snprintf(fmt, size, "%s%s%s%s%s%s%s", s1, s2, s3, s4, s5, s6, s7);
        fmt[size - 1] = '\0';
    }
    return fmt;
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
    if (fmt_alloc(size)) {
        snprintf(fmt, size, "%s%s%s%s%s%s%s%s", s1, s2, s3, s4, s5, s6, s7, s8);
        fmt[size - 1] = '\0';
    }
    return fmt;
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
    if (fmt_alloc(size)) {
        snprintf(fmt, size, "%s%s%s%s%s%s%s%s%s", s1, s2, s3, s4, s5, s6, s7, s8, s9);
        fmt[size - 1] = '\0';
    }
    return fmt;
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
    if (fmt_alloc(size)) {
        snprintf(fmt, size, "%s%s%s%s%s%s%s%s%s%s", s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);
        fmt[size - 1] = '\0';
    }
    return fmt;
}

int print(const char* str) {
    if (!str) {
        return -1;
    }
    int num = printf(str);
    fmt_free();
    return num;
}
