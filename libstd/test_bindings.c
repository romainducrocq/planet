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
int print(const char* str);

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
