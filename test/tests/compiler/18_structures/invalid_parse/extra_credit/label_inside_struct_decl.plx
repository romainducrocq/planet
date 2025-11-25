# Labels can't appear inside structure declarations

type struc s (
    i: i32,
    # NOTE: GCC and clang will treat foo as a bit-field (a feature we aren't
    # implementing. If you implement bit-fields, this is still a parse error
    label foo
    j: i32
)

pub fn main(none) i32 {
    return 0
}
