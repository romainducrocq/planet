#include "print.h"

int printc(char c) { return putchar(c); }

int println(char* s) { return puts(s); }

int prints(char* s) { return fputs(s, stdout); }

int printerr(char* s) { return fputs(s, stderr); }

static char printu(unsigned long n, char maxpow10) {
    static unsigned long pow10[20] = {1ul, 10ul, 100ul, 1000ul, 10000ul, 100000ul, 1000000ul, 10000000ul, 100000000ul,
        1000000000ul, 10000000000ul, 100000000000ul, 1000000000000ul, 10000000000000ul, 100000000000000ul,
        1000000000000000ul, 10000000000000000ul, 100000000000000000ul, 1000000000000000000ul, 10000000000000000000ul};

    if (n == 0ul) {
        printc('0');
        return 1;
    }

    char len = 0;
    for (char i = maxpow10; i-- > 0;) {
        if (n < pow10[i]) {
            continue;
        }
        else if (printc(((n / pow10[i]) % 10ul) + '0') < 0) {
            return -1;
        }
        len++;
    }
    return len;
}

static char printi(long n, char maxpow10) {
    char isneg = 0;
    if (n < 0l) {
        if (printc('-') < 0) {
            return -1;
        }
        n *= -1l;
        isneg = 1;
    }

    char len = printu(n, maxpow10);
    return len > 0 ? len + isneg : -1;
}

int printu8(unsigned char n) { return printu(n, 3); }

int printi8(signed char n) { return printi(n, 3); }

int printu32(unsigned int n) { return printu(n, 10); }

int printi32(int n) { return printi(n, 10); }

int printu64(unsigned long n) { return printu(n, 20); }

int printi64(long n) { return printi(n, 19); }

void* memcpy(void* dest, void* src, unsigned long n);
static int isnegzero(double n) {
    if (n != 0.0) {
        return 0;
    }
    unsigned long x;
    memcpy(&x, &n, sizeof(unsigned long));
    return x == 9223372036854775808ul;
}

int printf64(double n) {
    if (n != n) {
        return prints("nan");
    }

    char isneg = 0;
    if (n < 0.0 || isnegzero(n)) {
        if (printc('-') < 0) {
            return -1;
        }
        n *= -1.0;
        isneg = 1;
    }

    if (n > 18446744073709549568.0) {
        // TODO handle very large doubles, treat as inf for now
        return prints("inf");
    }

    char len = printu(n, 20);
    if (len < 1) {
        return -1;
    }

    if (printc('.') < 0) {
        return -1;
    }

    if (n > 9223372036854774784.0) {
        n = 0.0;
    }
    else {
        n -= (long)n;
        n *= 1000000.0;
    }
    n += 10000000.5;
    return printu(n, 6) > 0 ? len + isneg + 7 : -1;
}
