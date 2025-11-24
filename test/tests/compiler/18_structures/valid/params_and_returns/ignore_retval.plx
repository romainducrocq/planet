#  Test returning a struct and discarding the result
#  * Make sure this works for structs passed in registers and
#  * on the stack
#  * 

type struc small(    x: i32    )

type struc big(    d: f64    
    , x: i32    
    , l: i64    )

pub globl: struc small = $(nil)
pub fn return_in_reg(none) struc small {
    globl.x = globl.x + 1
    return globl
}

pub globl2: struc big = $(1.25, 2, 300)
pub fn return_in_mem(none) struc big {
    globl2.d = globl2.d * 2
    globl2.x = globl2.x * 3
    globl2.l = globl2.l * 4
    return globl2
}

pub fn main(none) bool {
    #  can either explicitly cast result to void or just not use it
    cast<none>(return_in_reg())
    return_in_reg()
    if globl.x ~= 2 {
        return 1
    }

    #  do the same for struct return in memory
    return_in_mem()
    cast<none>(return_in_mem
        ())
    if globl2.d ~= 5.0 or globl2.x ~= 18 or globl2.l ~= 4800 {
        return 2
    }
    return 0 #  success
}
