int get_errno(void);
void set_errno(int value);
int get_EDOM(void);
int get_EILSEQ(void);
int get_ERANGE(void);

const char* fmt1(const char* s1);
const char* fmt2(const char* s1, const char* s2);
const char* fmt3(const char* s1, const char* s2, const char* s3);
const char* fmt4(const char* s1, const char* s2, const char* s3, const char* s4);
const char* fmt5(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5);
const char* fmt6(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6);
const char* fmt7(
    const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6, const char* s7);
const char* fmt8(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6,
    const char* s7, const char* s8);
const char* fmt9(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6,
    const char* s7, const char* s8, const char* s9);
const char* fmt10(const char* s1, const char* s2, const char* s3, const char* s4, const char* s5, const char* s6,
    const char* s7, const char* s8, const char* s9, const char* s10);

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

int main(void) {
    set_errno(42);
    char val[20] = {0};
    snprintf(val, 19, "%i", get_errno());
    set_errno(0);
    print(val);
    print("\n");

    long x = strtol("1337", 0, 10);
    snprintf(val, 19, "%li", x);
    print(val);
    print("\n");

    print(fmt1("Hello World\n"));
    print("Hello World\n");
    print(fmt3("My ", "name ", "is Romain\n"));

    char age[20] = {0};
    snprintf(age, 19, "%li", 29l);
    print(age);
    print("\n");
    return print(fmt6("My ", "name ", "is Romain ", "and my age is ", age, "\n"));
}
