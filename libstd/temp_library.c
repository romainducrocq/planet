// See Section 7 and Annex B
// https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2310.pdf

TODO:
// <float.h>
DBL_DECIMAL_DIG
DBL_DIG
DBL_MANT_DIG
DBL_MAX_10_EXP
DBL_MAX_EXP
DBL_MIN_10_EXP
DBL_MIN_EXP
DBL_MAX
DBL_EPSILON
DBL_MIN
// <limits.h>
CHAR_BIT
CHAR_MAX
CHAR_MIN
LONG_MAX
LONG_MIN
LLONG_MAX
LLONG_MIN
MB_LEN_MAX
SCHAR_MAX
SCHAR_MIN
UCHAR_MAX
ULONG_MAX
ULLONG_MAX
// TODO // <locale.h>

DONE:

; // <assert.h>
; // <complex.h>
// <ctype.h>
int isalnum(int c);
int isalpha(int c);
int isblank(int c);
int iscntrl(int c);
int isdigit(int c);
int isgraph(int c);
int islower(int c);
int isprint(int c);
int ispunct(int c);
int isspace(int c);
int isupper(int c);
int isxdigit(int c);
int tolower(int c);
int toupper(int c);
; // <fenv.h>
; // <inttypes.h>
; // <iso646.h>
; // <setjmp.h>
; // <signal.h>
; // <stdalign.h>
; // <stdarg.h>
; // <stdatomic.h>
; // <stdbool.h>
; // <stddef.h>
; // <stdint.h>
; // <stdnoreturn.h>
; // <tgmath.h>
; // <threads.h>
; // <uchar.h>
; // <wchar.h>
; // <wctype.h>
// <errno.h>
EDOM
EILSEQ
ERANGE
errno
// <stdlib.h>
int get_EXIT_FAILURE(void);
int get_EXIT_SUCCESS(void);
int get_RAND_MAX(void);
double atof(char* nptr);
int atoi(char* nptr);
long atol(char* nptr);
long atoll(char* nptr);
double strtod(char* nptr, char** endptr);
long strtol(char* nptr, char** endptr, int base);
long strtoll(char* nptr, char** endptr, int base);
unsigned long strtoul(char* nptr, char** endptr, int base);
unsigned long strtoull(char* nptr, char** endptr, int base);
int rand(void);
void srand(unsigned int seed);
void* aligned_alloc(unsigned long alignment, unsigned long size);
void* calloc(unsigned long nmemb, unsigned long size);
void free(void* ptr);
void* malloc(unsigned long size);
void* realloc(void* ptr, unsigned long size);
void abort(void);
void exit(int status);
void _Exit(int status);
char* getenv(char* name);
void quick_exit(int status);
int system(char* string);
int abs(int j);
long labs(long j);
long llabs(long j);
// <string.h>
void *memcpy(void * s1, void * s2, unsigned long n);
void *memmove(void *s1, void *s2, unsigned long n);
char *strcpy(char * s1, char * s2);
char *strncpy(char * s1, char * s2, unsigned long n);
char *strcat(char * s1, char * s2);
char *strncat(char * s1, char * s2, unsigned long n);
int memcmp(void *s1, void *s2, unsigned long n);
int strcmp(char *s1, char *s2);
int strcoll(char *s1, char *s2);
int strncmp(char *s1, char *s2, unsigned long n);
unsigned long strxfrm(char * s1, char * s2, unsigned long n);
void *memchr(void *s, int c, unsigned long n);
char *strchr(char *s, int c);
unsigned long strcspn(char *s1, char *s2);
char *strpbrk(char *s1, char *s2);
char *strrchr(char *s, int c);
unsigned long strspn(char *s1, char *s2);
char *strstr(char *s1, char *s2);
char *strtok(char * s1, char * s2);
void *memset(void *s, int c, unsigned long n);
char *strerror(int errnum);
unsigned long strlen(char *s);
// <time.h>
struct timespec;
struct tm;
unsigned long get_CLOCKS_PER_SEC(void);
unsigned long get_TIME_UTC(void);
unsigned long clock(void);
double difftime(unsigned long time1, unsigned long time0);
unsigned long mktime(struct tm *timeptr);
unsigned long time(unsigned long *timer);
int timespec_get(struct timespec *ts, int base);
char *asctime(struct tm *timeptr);
char *ctime(unsigned long *timer);
struct tm *gmtime(unsigned long *timer);
struct tm *localtime(unsigned long *timer);
unsigned long strftime(char * s, unsigned long maxsize, char * format, struct tm * timeptr);
struct FILE;
// <stdio.h>
int get__IOFBF(void);
int get__IOLBF(void);
int get__IONBF(void);
unsigned long get_BUFSIZ(void);
int get_EOF(void);
int get_FOPEN_MAX(void);
int get_FILENAME_MAX(void);
int get_L_tmpnam(void);
int get_SEEK_CUR(void);
int get_SEEK_END(void);
int get_SEEK_SET(void);
int get_TMP_MAX(void);
struct FILE* get_stderr(void);
struct FILE* get_stdin(void);
struct FILE* get_stdout(void);
int remove(char* filename);
int rename(char* old, char* new);
struct FILE* tmpfile(void);
char* tmpnam(char* s);
int fclose(struct FILE* stream);
int fflush(struct FILE* stream);
struct FILE* fopen(char* filename, char* mode);
struct FILE* freopen(char* filename, char* mode, struct FILE* stream);
void setbuf(struct FILE* stream, char* buf);
int setvbuf(struct FILE* stream, char* buf, int mode, unsigned long size);
int fgetc(struct FILE* stream);
char* fgets(char* s, int n, struct FILE* stream);
int fputc(int c, struct FILE* stream);
int fputs(char* s, struct FILE* stream);
int getc(struct FILE* stream);
int getchar(void);
int putc(int c, struct FILE* stream);
int putchar(int c);
int puts(char* s);
int ungetc(int c, struct FILE* stream);
unsigned long fread(void* ptr, unsigned long size, unsigned long nmemb, struct FILE* stream);
unsigned long fwrite(void* ptr, unsigned long size, unsigned long nmemb, struct FILE* stream);
int fseek(struct FILE* stream, long int offset, int whence);
long int ftell(struct FILE* stream);
void rewind(struct FILE* stream);
void clearerr(struct FILE* stream);
int feof(struct FILE* stream);
int ferror(struct FILE* stream);
void perror(char* s);
int fprint(struct FILE* stream, char* format);
int fscan(struct FILE* stream, char* format);
int print(char* format);
int scan(char* format);
int snprint(char* s, unsigned long n, char* format);
int sprint(char* s, char* format);
int sscan(char* s, char* format);
// <math.h>
