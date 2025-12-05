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

int main(void) {
    set_errno(42);
    char val[20] = {0};
    snprintf(val, 19, "%i", get_errno());
    print(val);
    set_errno(0);

    print(fmt1("Hello World\n"));
    print("Hello World\n");
    print(fmt3("My ", "name ", "is Romain\n"));

    char age[20] = {0};
    snprintf(age, 19, "%li", 29l);
    print(age);
    print("\n");
    return print(fmt6("My ", "name ", "is Romain ", "and my age is ", age, "\n"));
}
