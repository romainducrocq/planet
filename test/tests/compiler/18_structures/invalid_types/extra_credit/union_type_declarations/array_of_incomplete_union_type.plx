#  It's illegal to specify an array type with any incomplete
#  * element type, including union types.
#  

type union u; #  declare incomplete union type
pub fn main(none) i32 {
    #  declare pointer to array of three union u elements;
    #  illegal because union u is incomplete
    arr: *[3]union u;
    return 0
}
