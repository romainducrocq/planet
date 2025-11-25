# An initializer list must have at least one element
# NOTE: empty initializer lists are valid as of C23
type union u ( a: i32 )

pub fn main(none) i32 {
    x: union u = $()
}
