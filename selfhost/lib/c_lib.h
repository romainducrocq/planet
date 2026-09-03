#ifndef _LIB_C_LIB_H
#define _LIB_C_LIB_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// C lib

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Bindings

#ifdef __GCC_BOOTSTRAP__
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-library-redeclaration"
#elif defined(__GNUC__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wbuiltin-declaration-mismatch"
#endif
#endif

/* inttypes.h */
extern long strtoimax(char* nptr, char** endptr, int base);
extern unsigned long strtoumax(char* nptr, char** endptr, int base);

/* stdbool.h */
#define bool int
#define false 0
#define true 1

/* stdint.h */
#ifdef __GCC_BOOTSTRAP__
#include <stdint.h>
#else
#define int8_t signed char
#define int32_t int
#define int64_t long
#define uint8_t unsigned char
#define uint32_t unsigned int
#define uint64_t unsigned long
#endif

/* stdio.h */
#define NULL 0
#define FOPEN_MAX 8
struct FILE;
extern int fclose(struct FILE* stream);
extern int fflush(struct FILE* stream);
extern struct FILE* fopen(char* filename, char* mode);
extern unsigned long fwrite(void* ptr, unsigned long size, unsigned long nmemb, struct FILE* stream);
/* printf */
extern int printf(char* format, char* arg1);
extern int snprintf(char* s, unsigned long n, char* format, char* arg1, char* arg2, char* arg3, char* arg4);
extern int sprintf(char* s, char* format, unsigned int arg1);
/* _POSIX_C_SOURCE 200809L */
#define STDERR_FILENO 2
extern long getline(char** lineptr, unsigned long* n, struct FILE* stream);
extern long write(int fildes, void* buf, unsigned long nbyte);

/* stdlib.h */
extern double strtod(char* nptr, char** endptr);
extern long strtol(char* nptr, char** endptr, int base);
extern void free(void* ptr);
extern void* malloc(unsigned long size);
extern void* realloc(void* ptr, unsigned long size);
extern void abort(void);

/* string.h */
extern void* memcpy(void* s1, void* s2, unsigned long n);
extern void* memmove(void* s1, void* s2, unsigned long n);
extern int memcmp(void* s1, void* s2, unsigned long n);
extern int strcmp(char* s1, char* s2);
extern void* memset(void* s, int c, unsigned long n);
extern unsigned long strlen(char* s);

#ifdef __GCC_BOOTSTRAP__
#ifdef __clang__
#pragma clang diagnostic pop
#elif defined(__GNUC__)
#pragma GCC diagnostic pop
#endif
#endif

#endif
