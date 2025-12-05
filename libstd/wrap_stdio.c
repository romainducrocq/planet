
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

// TODO
// int main(void) {
//     print(fmt1("Hello World\n"));
//     print("Hello World\n");
//     print(fmt3("My ", "name ", "is Romain\n"));

//     char age[20] = {0};
//     snprintf(age, 19, "%li", 29l);
//     print(age);
//     print("\n");
//     return print(fmt6("My ", "name ", "is Romain ", "and my age is ", age, "\n"));
// }
