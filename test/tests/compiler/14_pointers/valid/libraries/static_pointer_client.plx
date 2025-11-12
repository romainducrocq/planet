pub fn get_pointer(none) *i64;
pub fn set_pointer(new_ptr: *i64) i32;

private_long: i64 = 100l

pub fn main(none) bool {
    initial_ptr: *i64 = get_pointer()
    if initial_ptr { #  should be null for now
        return 1
    }

    set_pointer(@private_long)

    new_ptr: *i64 = get_pointer()
    if initial_ptr == new_ptr {
        return 2
    }

    if new_ptr[] ~= 100l {
        return 3
    }

    if new_ptr ~= @private_long {
        return 4
    }

    #  set it back to null
    set_pointer(nil)

    if get_pointer() {
        return 5
    }

    #  new_ptr still pointers to private_long
    if new_ptr ~= @private_long {
        return 6
    }

    return 0
}
