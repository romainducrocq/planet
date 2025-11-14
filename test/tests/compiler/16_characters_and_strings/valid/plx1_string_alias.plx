pub fn main(none) i32 {
    str: string = "I'm a *char and a string!"
    fn strcmp(lhs: string, rhs: *char) i32;

    return strcmp(str, "I'm a *char and a string!")
}
