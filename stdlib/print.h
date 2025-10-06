struct FILE;
extern struct FILE* stdin;
extern struct FILE* stdout;
extern struct FILE* stderr;

int putchar(int c);
int puts(char* s);
int fputs(char* s, struct FILE* fd);

int printc(char c);
int println(char* s);
int prints(char* s);
int printerr(char* s);
int printu8(unsigned char n);
int printi8(signed char n);
int printu32(unsigned int n);
int printi32(int n);
int printu64(unsigned long n);
int printi64(long n);
int printf64(double n);
