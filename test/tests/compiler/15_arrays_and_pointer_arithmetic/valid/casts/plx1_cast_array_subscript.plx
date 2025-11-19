pub fn main(none) i32 {
    arr: [3]i32 = $(10, 20, 40)

    arr[1] = cast<*i32>(arr)[0] + cast<*i32>(arr)[1]
    return cast<*i32>(@arr[2])[] - (
        cast<*i32>(arr)[0] + cast<*i32>(arr)[1])
}
