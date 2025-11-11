pub fn main(none) i32 {
    # "30." won't match our regex because it's followed by a letter.
    # It's a preprocessing number but not a valid constant token.
    #
    foo: f64 = 30.e
    return 4
}
