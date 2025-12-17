#  If a copy is generated on all paths to a block,
#  * and its source is updated on one path,
#  * it doesn't reach that block
#  * 

use "stdio"

pub fn f(src: i32, flag: i32) i32 {
    x: i32 = src #  generate x = src
    if flag {
        src = 65 #  kill x = src
    }
    putchar(src) #  use src so assignment doesn't get optimized away entirely
    return x #  make sure we don't rewrite this as 'return src'
}

pub fn main(none) i32 {
    #  first call f with flag = 0;
    #  validate return value, and make sure
    #  src is not updated
    if f(68, 0) ~= 68 {
        return 1
    }

    #  now call f with flag = 1;
    #  validate return value and make sure
    #  src is updated
    if f(70, 1) ~= 70 {
        return 2
    }

    return 0 #  success
}
