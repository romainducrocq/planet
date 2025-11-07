pub fn fib(a: i32) i32;

pub fn multiply_many_args(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32) i32;

pub fn main(none) i32 {
    x: i32 = fib(4) #  3
    #  at least until we implement optimizations, seven will have other values
    #  adjacent to it in memory, which we'll push onto the stack when we pass it as an arg;
    #  this tests that the caller will just look at 7 and not the junk bytes next to it
    seven: i32 = 7
    eight: i32 = fib(6)
    y: i32 = multiply_many_args(x, 2
        , 3, 4
        , 5, 6, seven
        , eight)
    if x ~= 3 {
        return 1
    }
    if y ~= 589680 {
        return 2
    }
    return x + (y % 256)
}
