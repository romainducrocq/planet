


pub fn main(none) i32 {
    outer: i32 = 1
    foo: i32 = 0
    if outer {
        #  You can declare a variable with linkage
        #          * multiple times in the same block;
        #          * these both refer to the 'foo' variable defined below
        #          
        extrn foo: i32;
        extrn foo: i32;
        return foo
    }
    return 0
}

pub foo: i32 = 3
