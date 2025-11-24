type struc s;

pub ptr: *struc s = 0

pub fn main(none) i32 {
    #  can't dereference pointer to incomplete type
    #  except in expression &*ptr
    ptr[]
    return 0
}
