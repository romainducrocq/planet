#  Writing to union member kills previous copies to/from that union 

type union u(    l: i64    , i: i32    
    )

pub fn main(none) i32 {
    data u1: union u = $(20)
    u2: union u = $(3)
    u1 = u2 #  generate u1 = u2
    u2.i = 0 #  kill u1 = u2

    return u1.i #  make sure we don't propagate u2 into this return statement
}
