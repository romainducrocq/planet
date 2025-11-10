#  make sure we support prefix and postfix ++/-- on long variables
pub fn main(none) i32 {
    x: i64 = -9223372036854775807l

    #  postfix ++
    if x++ ~= -9223372036854775807l {
        return 1
    }
    if x ~= -9223372036854775806l {
        return 2
    }

    #  prefix --
    if --x ~= -9223372036854775807l {
        return 3
    }
    if x ~= -9223372036854775807l {
        return 4
    }

    return 0 #  success
}
