use "math"

pub fn main(none) i32 {
    acos(0.0)
    asin(0.0)
    atan(0.0)
    atan2(0.0, 0.0)
    cos(0.0)
    sin(0.0)
    tan(0.0)
    acosh(0.0)
    asinh(0.0)
    atanh(0.0)
    cosh(0.0)
    sinh(0.0)
    tanh(0.0)
    exp(0.0)
    exp2(0.0)
    expm1(0.0)
    {
        exp: i32 = 0
        frexp(0.0, @exp)
    }
    ilogb(0.0)
    ldexp(0.0, 0)
    log(0.0)
    log10(0.0)
    log1p(0.0)
    log2(0.0)
    logb(0.0)
    {
        iptr: f64 = 0.0
        modf(0.0, @iptr)
    }
    scalbn(0.0, 0)
    scalbln(0.0, 0.0)
    cbrt(0.0)
    fabs(0.0)
    hypot(0.0, 0.0)
    pow(0.0, 0.0)
    sqrt(0.0)
    erf(0.0)
    erfc(0.0)
    lgamma(0.0)
    tgamma(0.0)
    ceil(0.0)
    floor(0.0)
    nearbyint(0.0)
    rint(0.0)
    lrint(0.0)
    llrint(0.0)
    round(0.0)
    lround(0.0)
    llround(0.0)
    trunc(0.0)
    fmod(0.0, 0.0)
    remainder(0.0, 0.0)
    {
        quo: i32 = 0
        remquo(0.0, 0.0, @quo)
    }
    copysign(0.0, 0.0)
    nan("")
    nextafter(0.0, 0.0)
    fdim(0.0, 0.0)
    fmax(0.0, 0.0)
    fmin(0.0, 0.0)
    fma(0.0, 0.0, 0.0)

    get_HUGE_VAL()
    get_INFINITY()
    get_NAN()
    get_FP_INFINITE()
    get_FP_NAN()
    get_FP_NORMAL()
    get_FP_SUBNORMAL()
    get_FP_ZERO()
    get_FP_ILOGB0()
    get_FP_ILOGBNAN()
    get_MATH_ERRNO()
    get_MATH_ERREXCEPT()
    get_math_errhandling()

    if get_fpclassify(0.0 / 0.0) ~= get_FP_NAN() {
        return 1
    }
    if not get_isfinite(get_FP_ZERO()) {
        return 2
    }
    if not get_isinf(get_INFINITY()) {
        return 3
    }
    if not get_isnan(get_NAN()) {
        return 4
    }
    if not get_isnormal(get_FP_NORMAL()) {
        return 5
    }
    if not get_signbit(-1.0) {
        return 6
    }
    if not get_isgreater(1.0, 0.0) {
        return 7
    }
    if not get_isgreaterequal(1.0, 1.0) {
        return 8
    }
    if not get_isless(0.0, 1.0) {
        return 9
    }
    if not get_islessequal(-1.0, -1.0) {
        return 10
    }
    if not get_islessgreater(0.0, 1.0) {
        return 11
    }
    if not get_isunordered(get_NAN(), get_NAN()) {
        return 12
    }

    return 0
}
