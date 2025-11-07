pub fn fib(n: i32) i32 {
    if n == 0 or n == 1 {
        return n
    }
    else {
        return fib(n - 1) + fib(n - 2)
    }
}

pub fn multiply_many_args(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g
    : i32, h
    : i32) i32 {

    return a * b * c * d * e * f * fib(g) * fib(
        h)
}
