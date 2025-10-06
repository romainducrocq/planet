// TODO dirty poc for libc

#include <print.h>

int main(void) {
    prints("int32:\n");
    printi32(-987654321);
    prints(", ");
    printi32(-2147483647);
    prints(", ");
    printi32(-0);
    println("");
    printu32(123456789u);
    prints(", ");
    printu32(4294967295u);
    prints(", ");
    printu32(0u);

    prints("\n\nint64:\n");
    printi64(-987654321098765432l);
    prints(", ");
    printi64(-9223372036854775807l);
    prints(", ");
    printi64(-0l);
    println("");
    printu64(1234567890123456789ul);
    prints(", ");
    printu64(18446744073709551615ul);
    prints(", ");
    printu64(0ul);

    prints("\n\nint8:\n");
    printi8(-9);
    prints(", ");
    printi8(-127);
    prints(", ");
    printi8(-0);
    println("");
    printu8(1);
    prints(", ");
    printu8(255);
    prints(", ");
    printu8(0);

    prints("\n\ndouble:\n");
    printf64(-0.0);
    prints(", ");
    printf64(0.0 / 0.0);
    prints(", ");
    printf64(-18446744073709551616.0);
    prints(", ");
    printf64(18446744073709551616.0);
    println("");
    printf64(1234.567890);
    prints(", ");
    printf64(1234.005700);
    prints(", ");
    printf64(1234.5060);
    prints(", ");
    printf64(0.);
    prints(", ");
    printf64(0.1234);
    println("");
    printf64(9223372036854774784.0);
    prints(", ");
    printf64(-9223372036854775808.0);
    prints(", ");
    printf64(18446744073709549568.0);

    prints("\n\nchar:\n");
    printc('a');
    prints(", ");
    printc(0);
    prints(", ");
    prints("Hello, World!");
    prints(", ");
    prints("");
    println("");
    return 0;
}
