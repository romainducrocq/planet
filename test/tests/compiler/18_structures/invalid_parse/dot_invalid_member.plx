type struc s(y: i32)

pub x: struc s;
# dot operator must be immediately followed by member name
# (can't parenthesize it)
pub fn main(none) i32 {
    return x.(y)
}

