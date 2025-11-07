pub fn fib(n: i32) i32 {
    if n == 0 or n == 1 {
        return n
    }
    else {
        return fib(n - 1) + fib(n - 2)
    }
}

pub fn main(none) i32 {
    n: i32 = 6
    return fib(n)
}
