#  This test case verifies that we correctly rewrite expressions
#  that use static variables; i.e. we recognize that they are memory operands

pub fn main(none) i32 {
    data i: i32 = 2
    data j: i32 = 3
    cmp: i32 = i < j #  make sure rewrite cmpl j(%rip), i(%rip)

    if not cmp {
        return 1
    }
    return 0
}
