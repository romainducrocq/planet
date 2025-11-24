#  Basic test of union type declarations, initializers, and member access 

#  declare a union type
type union u(    d: f64    , l: i64    
    , ul: u64    , c: char    
    )

pub fn main(none) i32 {
    #  declare and initialize a union
    x: union u = $(20) #  this initializes first member

    #  read member
    if x.d ~= 20.0 {
        return 1 #  fail
    }

    #  assign/read through pointer
    ptr: *union u = @x
    ptr[].l = -1l
    if ptr[].l ~= -1l {
        return 2 #  fail
    }

    #  read through other members
    if ptr[].ul ~= 18446744073709551615ul {
        return 3 #  fail
    }

    if x.c ~= -1 {
        return 4 #  fail
    }
    return 0
}
