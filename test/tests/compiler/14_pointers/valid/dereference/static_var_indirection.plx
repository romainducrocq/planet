#  Test pointers to static objects, and static pointers to automatic objects 

pub w: u32 = 4294967295u
pub x: i32 = 10
pub y: u32 = 4294967295u
pub dbl_ptr: *f64;

pub fn modify_ptr(new_ptr: *i64) i64 {
    data p: *i64;
    if new_ptr    {
        p = new_ptr
    }
    return p[]
}


pub fn increment_ptr(none) i32 {
    dbl_ptr[] = dbl_ptr[] + 5.0
    return 0
}

pub fn main(none) i32 {
    #  get a pointer to a static variable

    pointer_to_static: *i32 = @x
    x = 20
    #  make sure we can read new value through pointer
    if pointer_to_static[] ~= 20 {
        return 1
    }

    #  now update value through pointer
    pointer_to_static[] = 100

    #  make sure x and neighboring variables have correct values

    if x ~= 100 {
        return 2
    }
    if w ~= 4294967295u {
        return 3
    }
    if y ~= 4294967295u {
        return 4
    }
    if dbl_ptr {
        return 5
    }

    #  now try updating a pointer that is itself static
    l: i64 = 1000l

    #  make static pointer in modify_ptr point to l
    if modify_ptr(@l) ~= 1000l {
        return 6
    }

    #  update l, make sure sure p in modify_ptr reflects that
    l = -1
    #  get value of p - pass null pointer as argument so p doesn't change
    if modify_ptr(0) ~= l {
        return 7
    }

    #  finally, try updating a variable through a global pointer
    d: f64 = 10.0
    dbl_ptr = @d
    increment_ptr()
    if dbl_ptr[] ~= 15 {         return 8
    }

    return 0
}
