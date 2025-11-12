#  define a pointer that can be read/written only through functions
#  note that these functions read/write the pointer itself, not the object it points to

long_ptr: *i64;

pub fn get_pointer(none) *i64 {
    return long_ptr
}

pub fn set_pointer(new_ptr: *i64) i32 {
    long_ptr = new_ptr
    return nil
}
