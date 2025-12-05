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
// <math.h>
HUGE_VAL
INFINITY
NAN
FP_INFINITE
FP_NAN
FP_NORMAL
FP_SUBNORMAL
FP_ZERO
FP_FAST_FMA
FP_FAST_FMAF
FP_FAST_FMAL
FP_ILOGB0
FP_ILOGBNAN
MATH_ERRNO
MATH_ERREXCEPT
math_errhandling
int fpclassify(real-floating x);
int isfinite(real-floating x);
int isinf(real-floating x);
int isnan(real-floating x);
int isnormal(real-floating x);
int signbit(real-floating x);
double acos(double x);
double asin(double x);
double atan(double x);
double atan2(double y, double x);
double cos(double x);
double sin(double x);
double tan(double x);
double acosh(double x);
double asinh(double x);
double atanh(double x);
double cosh(double x);
double sinh(double x);
double tanh(double x);
double exp(double x);
double exp2(double x);
double expm1(double x);
double frexp(double value, int *exp);
int ilogb(double x);
double ldexp(double x, int exp);
double log(double x);
double log10(double x);
double log1p(double x);
double log2(double x);
double logb(double x);
double modf(double value, double *iptr);
double scalbn(double x, int n);
double scalbln(double x, long int n);
double cbrt(double x);
double fabs(double x);
double hypot(double x, double y);
double pow(double x, double y);
double sqrt(double x);
double erf(double x);
double erfc(double x);
double lgamma(double x);
double tgamma(double x);
double ceil(double x);
double floor(double x);
double nearbyint(double x);
double rint(double x);
long int lrint(double x);
long long int llrint(double x);
double round(double x);
long int lround(double x);
long long int llround(double x);
double trunc(double x);
double fmod(double x, double y);
double remainder(double x, double y);
double remquo(double x, double y, int *quo);
double copysign(double x, double y);
double nan(const char *tagp);
double nextafter(double x, double y);
double nexttoward(double x, long double y);
double fdim(double x, double y);
double fmax(double x, double y);
double fmin(double x, double y);
double fma(double x, double y, double z);
int isgreater(real-floating x, real-floating y);
int isgreaterequal(real-floating x, real-floating y);
int isless(real-floating x, real-floating y);
int islessequal(real-floating x, real-floating y);
int islessgreater(real-floating x, real-floating y);
int isunordered(real-floating x, real-floating y);
// TODO // <stdio.h>

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
