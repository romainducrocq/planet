pub fn main(none) i32 {
    #  different labels do not define different scopes
    label label1
    a: i32 = 10
    label label2
    a: i32 = 11
    return 1
}
