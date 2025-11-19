extrn v1: none;

pub fn main(none) i32 {
    #  in our implementation, you can't declare void variables
    #  the standard is ambiguous about whether this is legal,
    #  but you definitely can't declare a void variable and assign to it
    v1 = cast<none>(0)
    return nil
}
