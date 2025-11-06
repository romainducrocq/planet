pub fn main(none) i32 {
    x: i32 = 10
    #  two versions of empty switch statements;
    #  in both , we execute the controlling expression even though there's
    #  nothing to execute in the body
    match x = x + 1;
    match x = x + 1 {
        ;
    }
    return x
}
