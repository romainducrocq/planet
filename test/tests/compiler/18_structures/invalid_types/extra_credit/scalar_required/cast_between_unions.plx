#  Can't cast operand to union type even if it already has that type

type union u1(    a: i32    )


pub fn main(none) i32 {
    var: union u1 = $(10)
    cast<union u1>(var) #  illegal - no casts to union type
    return 0
}
