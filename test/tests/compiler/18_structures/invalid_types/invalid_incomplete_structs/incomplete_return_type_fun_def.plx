pub fn exit(status: i32) none;

type struc s;

#  you can't define a function with an incomplete return type,
#  even if it doesn't actually return a value
pub fn return_struct_def(none) struc s {
    exit(nil)
}

pub fn main(none) i32 {
    return 0
}
