#  Test comparisons to several null pointer constants 



#  we have to suppress warning for non_null != 0u
#  this warning is bogus: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110238




pub fn get_null_pointer(none) *f64 {
    return 0
}

pub fn main(none) i32 {
    x: f64;
    null: *f64 = get_null_pointer()
    non_null: *f64 = @x

    if non_null == nil {
        return 1
    }

    if not (null == 0l) {
        return 2
    }

    if not (non_null ~= 0u) {
        return 3
    }

    if null ~= 0ul {
        return 4
    }

    return 0
}
