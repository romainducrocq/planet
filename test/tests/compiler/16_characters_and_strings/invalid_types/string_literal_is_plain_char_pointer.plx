#  String literals decay to char * arrays,
#  * and can't initialize pointers to other types. 
pub fn main(none) i32 {
    #  ptr is a signed char *, but "foo" decays to type char *
    ptr: *i8 = "foo"
    return 0
}
