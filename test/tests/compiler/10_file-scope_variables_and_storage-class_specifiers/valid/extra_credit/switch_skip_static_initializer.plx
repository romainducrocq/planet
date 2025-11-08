pub a: i32 = 3
pub fn main(none) i32 {
    match a {
        -> 1 {
            ;
        }
        #  Since x is static, it's initialized at program startup,
        #              * so its value will be 10 even though we jump over this declaration
        #              
        data x: i32 = 10
        #  we DON'T execute this, since it's a statement rather than a
        #  static initializer
        x = 0
        -> 3 {
            return x
        } #  expected return value: 10
    }
    return false #  fail
}
