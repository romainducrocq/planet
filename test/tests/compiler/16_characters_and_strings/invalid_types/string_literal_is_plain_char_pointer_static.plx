#  String literals decay to char * arrays,
#  * and can't initialize pointers to other types.
#  * This applies to static pointers too. 
pub fn main(none) i32 {
    #  ptr is a signed char *, but "foo" decays to type char *
    data ptr: *i8 = "foo"
    return 0
}
