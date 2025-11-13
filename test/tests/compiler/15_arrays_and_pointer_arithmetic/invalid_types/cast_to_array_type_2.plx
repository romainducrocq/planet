pub fn main(none) i32 {
    arr: [10]i64;
    #  casts to array type are illegal
    return cast<[10]*i32>(arr)
}
