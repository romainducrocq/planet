#include "value_0.h"
#include "value_1.h"
#include "value_2.h"
#include "value_3.h"
#include "value_4.h"
#include "value_5.h"

int puts(char* s);

int main(void) {
    if (VAL_0 != 1) {
        puts("error 0\n");
        return 7;
    }
    if (VAL_1 != 10) {
        puts("error 1\n");
        return 1;
    }
    if (VAL_2 != 20) {
        puts("error 2\n");
        return 2;
    }
    if (VAL_3 != 30) {
        puts("error 3\n");
        return 3;
    }
    if (VAL_4 != 40) {
        puts("error 4\n");
        return 4;
    }
    if (VAL_5 != 50) {
        puts("error 5\n");
        return 5;
    }
#ifdef VAL_BONUS
    puts("Success: wheelcc\n");
    return 0;
#else
    puts("No val bonus...\n");
    return 6;
#endif
}
