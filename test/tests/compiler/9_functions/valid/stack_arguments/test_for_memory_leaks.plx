#  Make sure stack arguments are deallocated correctly after returning from a function call; also test passing variables as stack arguments 





pub fn lots_of_args(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32, i: i32, j: i32, k: i32, l: 
    i32, m: 
    i32, n: i32, 
    o: i32) i32 {
    return l + o
}

pub fn main(none) i32 {
    ret: i32 = 0
    loop i: i32 = 0 while i < 10000000 .. i = i + 1 {
        ret = lots_of_args(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ret, 13, 14, 15)
    }
    return ret == 150000000
}
