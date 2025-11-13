pub fn main(none) i32 {
    #  It's legal to initialize a scalar with a single value wrapped in braces, e.g.
    #  int x = {1};
    #  although our implementation doesn't support this form.
    #  However, it's illegal to initialize a scalar with a compound initializer containing multiple values.
    x: i32 = $(1, 2, 3)
    return x
}
