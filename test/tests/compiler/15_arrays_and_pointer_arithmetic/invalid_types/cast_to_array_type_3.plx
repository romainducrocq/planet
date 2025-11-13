pub fn main(none) i32 {
    arr: [6]i64;
    #  casts to array type are illegal
    return (cast<[2][3]i64>(arr))
}
