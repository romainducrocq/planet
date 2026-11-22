#include <math.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Wrap math defines

double get_HUGE_VAL(void) { return HUGE_VAL; }
double get_INFINITY(void) { return INFINITY; }
double get_NAN(void) {
#ifndef NAN
#define NAN 0.0 / 0.0
#endif
    return NAN;
}
double get_FP_INFINITE(void) { return FP_INFINITE; }
double get_FP_NAN(void) { return FP_NAN; }
double get_FP_NORMAL(void) { return FP_NORMAL; }
double get_FP_SUBNORMAL(void) { return FP_SUBNORMAL; }
double get_FP_ZERO(void) { return FP_ZERO; }
double get_FP_ILOGB0(void) { return FP_ILOGB0; }
double get_FP_ILOGBNAN(void) { return FP_ILOGBNAN; }
int get_MATH_ERRNO(void) { return MATH_ERRNO; }
int get_MATH_ERREXCEPT(void) { return MATH_ERREXCEPT; }
int get_math_errhandling(void) { return math_errhandling; }

int get_fpclassify(double x) { return fpclassify(x); }
int get_isfinite(double x) { return isfinite(x); }
int get_isinf(double x) { return isinf(x); }
int get_isnan(double x) { return isnan(x); }
int get_isnormal(double x) { return isnormal(x); }
int get_signbit(double x) { return signbit(x); }
int get_isgreater(double x, double y) { return isgreater(x, y); }
int get_isgreaterequal(double x, double y) { return isgreaterequal(x, y); }
int get_isless(double x, double y) { return isless(x, y); }
int get_islessequal(double x, double y) { return islessequal(x, y); }
int get_islessgreater(double x, double y) { return islessgreater(x, y); }
int get_isunordered(double x, double y) { return isunordered(x, y); }
