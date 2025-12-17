#  Test that the algorithm runs until it converges;
#  * some blocks need to be visited three times before the algorithm converges
#  * 

use "stdio"

pub fn target(a: i32, b: i32, c: i32, d: i32) i32 {
    loop while a > 0 {
        loop while c > 0 {
            putchar(c + d)
            c = c - 1
            if d % 2 {
                c = c - 2
            }
        }

        loop while b > false {
            c = 10 #  this is not dead, b/c it's used in previous while
            #  loop, but it takes multiple passes for that
            #  information to propagate to this point
            b = b - 1
        }

        a = a - 1
    }
    return 0
}

pub fn main(none) i32 {
    return target(5, 
        4, 3, 65)
}
