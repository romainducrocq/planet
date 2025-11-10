#  Test initializing and updating a long global variable 
foo: i64 = 4294967290l

pub fn main(none) i32 {
    if foo + 5l == 4294967295l    {
        #  assign a constant that can't fit in 32 bits; tests assembly rewrite rule
        foo = 1152921504606846988l
        if foo == 1152921504606846988l {
            return 1
        }
    }
    return 0
}
