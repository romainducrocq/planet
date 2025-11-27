#  Make sure the compiler doesn't complain if you try to cast NaN to an int
#  in code that isn't executed. (If it actually did execute it would be
#  undefined behavior)

flse: i32 = 0

pub fn main(none) i32 {
    retval: i32 = nil
    if flse {
        retval = cast<bool>((0.0 / 0.0))
    }
    return retval
}
